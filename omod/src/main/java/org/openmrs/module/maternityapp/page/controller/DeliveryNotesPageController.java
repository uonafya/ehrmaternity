package org.openmrs.module.maternityapp.page.controller;

import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.OpdPatientQueue;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.InternalReferral;
import org.openmrs.module.mchapp.api.MchService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.module.mchapp.api.parsers.QueueLogs;
import org.openmrs.module.patientdashboardapp.model.Referral;
import org.openmrs.module.patientdashboardapp.model.ReferralReasons;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.expression.ParseException;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * Created by franqq on 8/30/16.
 */
public class DeliveryNotesPageController {
    public void get(
            @RequestParam("patientId") Patient patient,
            @RequestParam(value = "queueId") Integer queueId,
            PageModel model,
            UiUtils ui) {
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
        model.addAttribute("title","Delivery Notes");
        model.addAttribute("internalReferrals", SimpleObject.fromCollection(Referral.getInternalReferralOptions(), ui, "label", "id", "uuid"));
        model.addAttribute("externalReferrals", SimpleObject.fromCollection(Referral.getExternalReferralOptions(), ui, "label", "id", "uuid"));
        model.addAttribute("referralReasons", SimpleObject.fromCollection(ReferralReasons.getReferralReasonsOptions(), ui, "label", "id", "uuid"));


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
            String encounterType = MaternityMetadata._MaternityEncounterType.MATERNITY_ENCOUNTER_TYPE;
            Encounter encounter = Context.getService(MaternityService.class).saveMaternityEncounter(form, encounterType, session.getSessionLocation());
            InternalReferral internalReferral = new InternalReferral();
            String refferedRoomUuid = request.getRequest().getParameter("internalRefferal");
            if (refferedRoomUuid != "" && refferedRoomUuid != null && !refferedRoomUuid.equals(0) && !refferedRoomUuid.equals("0")) {
                internalReferral.sendToRefferedRoom(patient, refferedRoomUuid);
            }
            QueueLogs.logOpdPatient(patientQueue, encounter);
        } catch (java.text.ParseException e) {
            e.printStackTrace();
        }
       return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "maternityClinicQueue", null);
    }
}
