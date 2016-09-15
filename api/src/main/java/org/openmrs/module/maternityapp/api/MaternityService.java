package org.openmrs.module.maternityapp.api;

import org.openmrs.Encounter;
import org.openmrs.Location;
import org.openmrs.module.mchapp.api.model.ClinicalForm;

/**
 * Created by franqq on 8/31/16.
 */
public interface MaternityService {
    Encounter saveMaternityEncounter(ClinicalForm form, String encounterType,
                               Location location);

    void admitPatientToMaternityWard(Encounter encounter);
}
