package org.openmrs.module.maternityapp.page.controller;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.TriagePatientQueue;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.InternalReferral;
import org.openmrs.module.mchapp.MchMetadata;
import org.openmrs.module.mchapp.api.MchService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.module.mchapp.api.parsers.QueueLogs;
import org.openmrs.module.mchapp.fragment.controller.PatientProfileGenerator;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Created by franqq on 8/30/16.
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

        model.addAttribute("patientProfile", PatientProfileGenerator.generatePatientProfile(patient, MchMetadata._MchProgram.ANC_PROGRAM));
        model.addAttribute("patientHistoricalProfile", PatientProfileGenerator.generateHistoricalPatientProfile(patient, MchMetadata._MchProgram.ANC_PROGRAM));

        model.addAttribute("enrolledInAnc", enrolledInANC);
        model.addAttribute("previousVisit", hospitalCoreService.getLastVisitTime(patient));
        model.addAttribute("patientCategory", patient.getAttribute(14));
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
            InternalReferral internalReferral = new InternalReferral();
            internalReferral.sendToRefferedRoom(patient,nextRoomConceptUuid);
            QueueLogs.logTriagePatient(patientQueue, encounter);
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
       return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "maternityTriageQueue", null);
    }
}
