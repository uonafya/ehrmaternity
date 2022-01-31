package org.openmrs.module.maternityapp.page.controller;

import org.apache.commons.lang.StringUtils;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.TriagePatientQueue;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.EhrMchMetadata;
import org.openmrs.module.mchapp.InternalReferral;
import org.openmrs.module.mchapp.api.MchService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.module.mchapp.api.parsers.QueueLogs;
import org.openmrs.module.mchapp.fragment.controller.PatientProfileGenerator;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * HealthIT
 */
public class TriagePageController {
    public void get(
            @RequestParam("patientId") Patient patient,
            @RequestParam(value = "queueId") Integer queueId,
            PageModel model) {
        model.addAttribute("patient", patient);
        model.addAttribute("queueId", queueId);

        if (patient.getGender().equals("M")) {
            model.addAttribute("gender", "Male");
        } else {
            model.addAttribute("gender", "Female");
        }

        HospitalCoreService hospitalCoreService = Context.getService(HospitalCoreService.class);
        MchService mchService = Context.getService(MchService.class);

        boolean enrolledInANC = mchService.enrolledInANC(patient);

        model.addAttribute("patientProfile", PatientProfileGenerator.generatePatientProfile(patient, EhrMchMetadata._MchProgram.ANC_PROGRAM));
        model.addAttribute("patientHistoricalProfile", PatientProfileGenerator.generateHistoricalPatientProfile(patient, EhrMchMetadata._MchProgram.ANC_PROGRAM));

        model.addAttribute("enrolledInAnc", enrolledInANC);
        model.addAttribute("previousVisit", hospitalCoreService.getLastVisitTime(patient));
        model.addAttribute("patientCategory",patient.getAttribute(Context.getPersonService().getPersonAttributeTypeByUuid("09cd268a-f0f5-11ea-99a8-b3467ddbf779")));
        model.addAttribute("patientId", patient.getPatientId());
        model.addAttribute("title","Maternity Triage");

    }

   public String post(
            @RequestParam("patientId") Patient patient,
            @RequestParam("queueId") Integer queueId,
            PageRequest request,
            UiSessionContext session,
            UiUtils ui) {
        try {
            TriagePatientQueue patientQueue = Context.getService(PatientQueueService.class).getTriagePatientQueueById(queueId);
            ClinicalForm form = ClinicalForm.generateForm(request.getRequest(), patient, null);
            String encounterType = MaternityMetadata._MaternityEncounterType.MATERNITY_ENCOUNTER_TYPE;
            Encounter encounter = Context.getService(MaternityService.class).saveMaternityEncounter(form, encounterType, session.getSessionLocation());
            String nextRoomConceptUuid = request.getRequest().getParameter("send_for_examination");
            if (StringUtils.isNotEmpty(nextRoomConceptUuid)) {
                if (nextRoomConceptUuid.equals(MaternityMetadata._MaternityConcepts.MATERNITY_WARD_CONCEPT_UUID)) {
                    MaternityService maternityService = Context.getService(MaternityService.class);
                    maternityService.admitPatientToMaternityWard(encounter);
                } else {
                    InternalReferral internalReferral = new InternalReferral();
                    internalReferral.sendToRefferedRoom(patient, nextRoomConceptUuid);
                }
            }
            QueueLogs.logTriagePatient(patientQueue, encounter);
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
       return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "maternityTriageQueue", null);
    }
}
