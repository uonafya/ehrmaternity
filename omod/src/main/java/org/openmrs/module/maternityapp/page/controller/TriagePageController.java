package org.openmrs.module.maternityapp.page.controller;

import org.apache.commons.lang.StringUtils;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.PatientProgram;
import org.openmrs.Program;
import org.openmrs.api.context.Context;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.OpdPatientQueue;
import org.openmrs.module.hospitalcore.model.PatientSearch;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by franqq on 8/30/16.
 */
public class TriagePageController {

    public void get(
            @RequestParam("patientId") Patient patient,
            @RequestParam(value = "queueId") Integer queueId,
            @RequestParam(value = "isEdit",required=false) Boolean isEdit,
            @RequestParam(value = "encounterId",required=false) String encounterId,
            PageModel model) {
        model.addAttribute("patient", patient);

        model.addAttribute("queueId", queueId);

        if (patient.getGender().equals("M")) {
            model.addAttribute("gender", "Male");
        } else {
            model.addAttribute("gender", "Female");
        }

        HospitalCoreService hospitalCoreService = Context.getService(HospitalCoreService.class);
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
            OpdPatientQueue patientQueue = Context.getService(PatientQueueService.class).getOpdPatientQueueById(queueId);
            ClinicalForm form = ClinicalForm.generateForm(request.getRequest(), patient, null);
            //Set this based on count of previous FP encounters
            String encounterType = FamilyPlanningMetadata._FamilyPlanningEncounterType.FP_NEW_ENCOUNTER_TYPE;
            Encounter encounter = Context.getService(MchService.class).saveMchEncounter(form, encounterType, session.getSessionLocation());
            QueueLogs.logOpdPatient(patientQueue, encounter);
        } catch (ParseException e) {
            log.error(e.getMessage());
            return null;
        }
        return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "mchClinicQueue", null);
    }
}
