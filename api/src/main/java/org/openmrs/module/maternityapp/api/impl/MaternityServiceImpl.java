package org.openmrs.module.maternityapp.api.impl;

import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.IpdService;
import org.openmrs.module.hospitalcore.model.IpdPatientAdmission;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;

import java.util.Date;

/**
 * Created by franqq on 8/31/16.
 */
public class MaternityServiceImpl implements MaternityService {
    @Override
    public Encounter saveMaternityEncounter(ClinicalForm form, String encounterType,
                                      Location location) {
        if (form == null) {
            throw new IllegalArgumentException("form argument cannot be null");
        }
        Encounter maternityEncounter = new Encounter();
        maternityEncounter.setPatient(form.getPatient());
        maternityEncounter.setLocation(location);
        Date encounterDateTime = new Date();
        if (form.getObservations().size() > 0) {
            encounterDateTime = form.getObservations().get(0).getObsDatetime();
        }
        maternityEncounter.setEncounterDatetime(encounterDateTime);
        EncounterType maternityEncounterType = Context.getEncounterService().getEncounterTypeByUuid(encounterType);
        maternityEncounter.setEncounterType(maternityEncounterType);
        for (Obs obs : form.getObservations()) {
            maternityEncounter.addObs(obs);
        }
        maternityEncounter= Context.getEncounterService().saveEncounter(maternityEncounter);

        return maternityEncounter;
    }
    public void admitPatientToMaternityWard(Encounter encounter){
        IpdPatientAdmission patientAdmission = new IpdPatientAdmission();
        patientAdmission.setAdmissionDate(encounter.getEncounterDatetime());
        patientAdmission.setAdmissionWard(Context.getConceptService().getConceptByUuid(MaternityMetadata._MaternityConcepts.MATERNITY_WARD_CONCEPT_UUID));
        patientAdmission.setBirthDate(encounter.getPatient().getBirthdate());
        patientAdmission.setGender(encounter.getPatient().getGender());
        patientAdmission.setOpdAmittedUser(encounter.getCreator());
        patientAdmission.setPatient(encounter.getPatient());
        patientAdmission.setPatientIdentifier(encounter.getPatient()
                .getPatientIdentifier().getIdentifier());
        if (encounter.getPatient().getMiddleName() != null) {
            patientAdmission.setPatientName(encounter.getPatient().getGivenName()
                    + " " + encounter.getPatient().getFamilyName() + " "
                    + encounter.getPatient().getMiddleName().replace(",", " "));
        } else {
            patientAdmission.setPatientName(encounter.getPatient().getGivenName()
                    + " " + encounter.getPatient().getFamilyName());
        }
        patientAdmission.setAcceptStatus(0);
        Context.getService(IpdService.class).saveIpdPatientAdmission(patientAdmission);
    }
}
