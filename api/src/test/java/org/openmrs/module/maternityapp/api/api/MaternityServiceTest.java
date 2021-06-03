package org.openmrs.module.maternityapp.api.api;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.Matchers.equalTo;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.mockito.Mockito;
import org.openmrs.Concept;
import org.openmrs.Encounter;
import org.openmrs.Location;
import org.openmrs.Obs;
import org.openmrs.Patient;
import org.openmrs.api.context.Context;
import org.openmrs.module.maternityapp.MaternityMetadata;
import org.openmrs.module.maternityapp.api.MaternityService;
import org.openmrs.module.mchapp.api.model.ClinicalForm;
import org.openmrs.test.BaseModuleContextSensitiveTest;

import java.util.Arrays;
import java.util.Date;

/**
 * Created by franqq on 8/31/16.
 */
@Ignore
public class MaternityServiceTest extends BaseModuleContextSensitiveTest {
    private Obs generateObs(Concept question, Concept answer) {
        Obs maternityObs = new Obs();
        maternityObs.setConcept(question);
        maternityObs.setValueCoded(answer);
        maternityObs.setObsDatetime(new Date());
        maternityObs.setCreator(Context.getAuthenticatedUser());
        return maternityObs;
    }
    @Test
    public void saveMaternityEncounter_shouldSaveMaternityEncounter() throws Exception {
        executeDataSet("maternity-data-set.xml");
        int patientId = 2;
        Patient patient = Context.getPatientService().getPatient(patientId);
        Concept ultrasoundDone = Context.getConceptService().getConcept(1744);
        Concept yes = Context.getConceptService().getConcept(7);
        Obs maternityObs = generateObs(ultrasoundDone, yes);
        ClinicalForm form = Mockito.mock(ClinicalForm.class);
        Mockito.when(form.getObservations()).thenReturn(Arrays.asList(maternityObs));
        Mockito.when(form.getPatient()).thenReturn(patient);
        Location location = Context.getLocationService().getLocation(1);

        Encounter encounter = Context.getService(MaternityService.class)
                .saveMaternityEncounter(form,  MaternityMetadata._MaternityEncounterType.MATERNITY_ENCOUNTER_TYPE, location);

        Assert.assertNotNull(encounter.getId());
        Assert.assertThat(encounter.getLocation(), equalTo(location));
        Assert.assertThat(encounter.getAllObs().size(), is(1));
        Assert.assertThat(encounter.getEncounterType().getUuid(), is(MaternityMetadata._MaternityEncounterType.MATERNITY_ENCOUNTER_TYPE));
    }

}
