package org.openmrs.module.maternityapp.page.controller;

import org.openmrs.Concept;
import org.openmrs.ConceptAnswer;
import org.openmrs.Encounter;
import org.openmrs.Patient;
import org.openmrs.PersonAttributeType;
import org.openmrs.api.context.Context;
import org.openmrs.module.appui.UiSessionContext;
import org.openmrs.module.hospitalcore.HospitalCoreService;
import org.openmrs.module.hospitalcore.PatientQueueService;
import org.openmrs.module.hospitalcore.model.OpdPatientQueue;
import org.openmrs.module.hospitalcore.model.Referral;
import org.openmrs.module.hospitalcore.model.ReferralReasons;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.InternalReferral;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.module.mchapp.api.parsers.QueueLogs;
import org.openmrs.module.metadatadeploy.MetadataUtils;
import org.openmrs.ui.framework.SimpleObject;
import org.openmrs.ui.framework.UiUtils;
import org.openmrs.ui.framework.page.PageModel;
import org.openmrs.ui.framework.page.PageRequest;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


/**
 * HealthIT
 */
public class DeliveryNotesPageController {
    public static final String DELIVERY_MODES = "5630AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    public static final String DELIVERY_COMPLICATIONS = "144438AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    public static final String BIRTH_OUTCOMES = "159917AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";

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

        Concept birthOutcomesConcept = Context.getConceptService().getConceptByUuid(BIRTH_OUTCOMES);
        Concept deliveryModesConcept = Context.getConceptService().getConceptByUuid(DELIVERY_MODES);
        Concept deliveryComplicationsConcept = Context.getConceptService().getConceptByUuid(DELIVERY_COMPLICATIONS);

        List<SimpleObject> birthOutcomesList = new ArrayList<SimpleObject>();
        List<SimpleObject> deliveryModesList = new ArrayList<SimpleObject>();
        List<SimpleObject> deliveryComplicationsList = new ArrayList<SimpleObject>();

        for (ConceptAnswer answer : birthOutcomesConcept.getAnswers()) {
            SimpleObject outcomes = new SimpleObject();
            outcomes.put("value", answer.getAnswerConcept().getDisplayString().toUpperCase());
            outcomes.put("uuid", answer.getAnswerConcept().getUuid());
            birthOutcomesList.add(outcomes);
        }

        for (ConceptAnswer answer : deliveryModesConcept.getAnswers()) {
            SimpleObject modes = new SimpleObject();
            modes.put("value", answer.getAnswerConcept().getDisplayString().toUpperCase());
            modes.put("uuid", answer.getAnswerConcept().getUuid());
            deliveryModesList.add(modes);
        }

        for (ConceptAnswer answer : deliveryComplicationsConcept.getAnswers()) {
            SimpleObject complications = new SimpleObject();
            complications.put("value", answer.getAnswerConcept().getDisplayString().toUpperCase());
            complications.put("uuid", answer.getAnswerConcept().getUuid());
            deliveryComplicationsList.add(complications);
        }
        PersonAttributeType personAttributeType = MetadataUtils.existing(PersonAttributeType.class, "09cd268a-f0f5-11ea-99a8-b3467ddbf779");
        HospitalCoreService hospitalCoreService = Context.getService(HospitalCoreService.class);
        model.addAttribute("previousVisit", hospitalCoreService.getLastVisitTime(patient));
        model.addAttribute("patientCategory", patient.getAttribute(personAttributeType));
        model.addAttribute("patientId", patient.getPatientId());
        model.addAttribute("title","Delivery Notes");
        model.addAttribute("internalReferrals", SimpleObject.fromCollection(Referral.getInternalReferralOptions(), ui, "label", "id", "uuid"));
        model.addAttribute("externalReferrals", SimpleObject.fromCollection(Referral.getExternalReferralOptions(), ui, "label", "id", "uuid"));
        model.addAttribute("referralReasons", SimpleObject.fromCollection(ReferralReasons.getReferralReasonsOptions(), ui, "label", "id", "uuid"));
        model.addAttribute("babyStatusList",this.babyOutcomeStatus());
        model.addAttribute("birthOutcomesList", birthOutcomesList);
        model.addAttribute("deliveryModesList", deliveryModesList);
        model.addAttribute("deliveryComplicationsList", deliveryComplicationsList);
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
       return "redirect:" + ui.pageLinkWithoutContextPath("patientqueueapp", "deliveryRoomQueue", null);
    }

    private Collection<ConceptAnswer> babyOutcomeStatus()
    {
        Collection<ConceptAnswer> babyOutcomes = new ArrayList<ConceptAnswer>();
        Concept babyOutcomeConcept = Context.getConceptService().getConceptByUuid(MaternityMetadata._MaternityConcepts.BABY_OUTCOME_STATUS_UUID);
        babyOutcomes = babyOutcomeConcept.getAnswers();
        return babyOutcomes;
    }
}
