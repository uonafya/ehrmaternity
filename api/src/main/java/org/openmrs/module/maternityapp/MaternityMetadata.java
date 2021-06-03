package org.openmrs.module.maternityapp;

import org.openmrs.module.metadatadeploy.bundle.AbstractMetadataBundle;
import org.springframework.stereotype.Component;

import static org.openmrs.module.metadatadeploy.bundle.CoreConstructors.encounterType;

/**
 * Created by franqq on 8/31/16.
 */
@Component
public class MaternityMetadata extends AbstractMetadataBundle {

    public static final class _MaternityEncounterType {
        public static final String MATERNITY_ENCOUNTER_TYPE = "04b0ac34-6f4f-11e6-8b77-86f30ca893d3";
    }
    public static final class _MaternityConcepts{
        public static final String MATERNITY_WARD_CONCEPT_UUID = "90462a4e-a449-4c39-87b2-ddff230ec175";
        public static final String BABY_OUTCOME_STATUS_UUID = "159926AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    }
    @Override
    public void install() throws Exception {
        install(encounterType("Maternity", "Maternity Clinic", _MaternityEncounterType.MATERNITY_ENCOUNTER_TYPE));
    }
}