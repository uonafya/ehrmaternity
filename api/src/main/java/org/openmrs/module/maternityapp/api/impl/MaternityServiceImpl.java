package org.openmrs.module.maternityapp.api.impl;

import org.openmrs.Encounter;
import org.openmrs.EncounterType;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.api.context.Context;
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
}
