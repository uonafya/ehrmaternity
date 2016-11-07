<script>
    var NavigatorController;
    jq(function () {
        NavigatorController = new KeyboardController();

        jq("#delivery-form-submit").on("click", function(){
            jq("#delivery-form").submit();
        });

        jq("field.patner-results").hide();

        jq(".is-tested").on("click", function() {
            var value = jq(this).data("value");
            if (value == "yes") {
                jq(this).closest("field").next("field.patner-results").show();
            } else if (value == "no"){
                jq(this).closest("field").next("field.patner-results").hide();
            }
        });
    });
</script>

<form method="post" class="simple-form-ui" id="delivery-form">
    <section>
        <span class="title">Delivery Details</span>
        <input type="hidden" name="patientId" value="${patientId}" >
        <input type="hidden" name="queueId" value="${queueId}" >
        <fieldset class="no-confirmation">
            <legend>Mother</legend>
            <div>
                <field>
                    <label for="labour-duration">Duration of Labour</label>
                    <input type="text" id="labour-duration" name="" class="number numeric-range" value="">
                    <span class="append-to-value">hrs</span>
                    <span  class="field-error" style="display: none"></span>
                </field>
            </div>
            <div>
                <field>
                    ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'delivery-date', label: 'Delivery Date and Time', formFieldName: 'concept.5599AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', useTime: true, defaultToday: true, endToday: true])}
                </field>
            </div>
            <div>
                <field>
                    <label for="delivery-mode">Mode of Deliver</label>
                    <select name="concept.a875ae0b-893c-47f8-9ebe-f721c8d0b130">
                        <option value="">Please mode of delivery</option>
                        <option value="9cbf6218-ae7a-476d-8322-0cb91f48c6c6">Normal Deliver</option>
                        <option value="1dbf27fb-c989-4015-b0f7-8ab5b6631005">Caeserean Section</option>
                        <option value="c81f4f5f-b62e-44c0-9485-bfe5d778a1a6">Breech</option>
                        <option value="0bd246e3-d4aa-4681-9136-e0b35e8162ec">Assisted vaginal delivery</option>
                    </select>
                </field>
             </div>
            <div>
                <field>
                    <label>Placenta Complete?</label>
                    <label style="padding-left:0px; width: auto;">
                        <input type="radio" name="concept.163455AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                        Yes
                    </label>
                    <label style="padding-left:0px; width: auto;">
                        <input type="radio" name="concept.163455AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                        No
                    </label>
                </field>
            </div>
            <div>
                <field>
                    <label for="blood-loss">Blood loss</label>
                    <input type="text" id="blood-loss" name="concept.161928AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
                    <span class="append-to-value">mls</span>
                    <span  class="field-error" style="display: none"></span>
                </field>
            <div>
                <field>
                    <label>Status after Delivery</label>
                    <label style="padding-left:0px; width: auto;">
                        <input type="radio" name="concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="160429AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                        Alive
                    </label>
                    <label style="padding-left:0px; width: auto;">
                        <input type="radio" name="concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="180BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB">
                        Dead
                    </label>
                </field>
            </div>
            <div>
                <field>
                    ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'death-audit-date', label: 'Date Maternal death audited', formFieldName: 'concept.6bc8d241-3b81-4f45-bf94-2b92ac79e7d1', useTime: true, defaultToday: true, endToday: true])}
                </field>
            </div>
            <div>
                <field>
                    <label for="delivery-complications">Delivery complications</label>
                    <select name="concept.144438AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                        <option value="">Please select delivery complications</option>
                        <option value="88286d13-5d65-4ee1-81fa-4a23dc976e07">Antepartum Haemorrhage</option>
                        <option value="37c1d10f-b557-4f76-86d1-69122e2c78c9">Postpartum Haemorrhage</option>
                        <option value="8db88891-e23c-4253-9c2f-7e63259e1e3c">Eclampsia</option>
                        <option value="127253AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Ruptured Uterus</option>
                        <option value="cdc05740-7d21-4bf3-86b3-ed5c37e1d070">Obstructed labour</option>
                        <option value="8388786c-cd97-4000-91df-b094a2641eac">Sepsis</option>
                    </select>
                </field>
             </div>
        </fieldset>
        <fieldset class="no-confirmation">
            <legend>Baby</legend>
            <field>
                <label>Status</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.159917AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="125872AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Live Birth
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.159917AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="159916AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Fresh Still Birth
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.159917AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="135436AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Macerated Still Birth
                </label>
            </field>
            <field>
                <label>Initiation of BF within 1 Hour</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.161543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.161543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
            <field>
                <label for="apgar-score">APGAR Score</label>
                <input type="text" id="apgar-score" name="concept.1504AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
                <span  class="field-error" style="display: none"></span>
            </field>
            <field>
                <label>Tetracycline at birth</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.a5d57f46-369e-4a7a-841f-5e8664fe014f" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.a5d57f46-369e-4a7a-841f-5e8664fe014f" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
            <field>
                <label>Birth with deformities</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.d702ab4a-cc19-4d8a-b20f-2d481c720e58" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.d702ab4a-cc19-4d8a-b20f-2d481c720e58" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
            <field>
                <label for="birth-notification-number">Birth Notification Number</label>
                <input type="text" id="apgar-score" name="" class="number numeric-range" value="">
                <span  class="field-error" style="display: none"></span>
            </field>
        </fieldset>
    </section>
    <section>
        <span class="title">Addition Info</span>
        <fieldset class="no-confirmation">
            <legend>PMTCT Information</legend>
            <field>
                <div>Prior Known Status</div>
                <label>
                    <input id="prior-status-positive" type="radio" data-value="Positive" name="concept.1406dbf3-05da-4264-9659-fb688cea5809" value="7480ebef-125b-4e0d-a8e5-256224ee31a0">
                    Positive
                </label><br/>
                <label>
                    <input id="prior-status-negative" type="radio" data-value="Negative" name="concept.1406dbf3-05da-4264-9659-fb688cea5809" value="aca8224b-2f4b-46cb-b75d-9e532745d61f">
                    Negative
                </label><br/>
                <label>
                    <input id="prior-status-unknown" type="radio" data-value="Unknown" name="concept.1406dbf3-05da-4264-9659-fb688cea5809" value="ec8e61d3-e9c9-4020-9c62-8403e14af5af">
                    Unknown
                </label>
            </field>
            <field>
                <div>VDRL/ RPR Results</div>
                <label>
                    <input id="prior-status-positive" type="radio" data-value="Positive" name="concept.0a24f03e-9133-4401-b683-76c45e166912" value="7480ebef-125b-4e0d-a8e5-256224ee31a0">
                    Positive
                </label>
                <label>
                    <input id="prior-status-negative" type="radio" data-value="Negative" name="concept.0a24f03e-9133-4401-b683-76c45e166912" value="aca8224b-2f4b-46cb-b75d-9e532745d61f">
                    Negative
                </label>
            </field>
            <field>
                <div>Patner Tested?</div>
                <label>
                    <input class="is-tested" data-value="yes" type="radio" data-value="Yes" name="concept.93366255-8903-44af-8370-3b68c0400930" value="4536f271-5430-4345-b5f7-37ca4cfe1553">
                    Yes
                </label>
                <label>
                    <input class="is-tested" data-value="no" type="radio" data-value="No" name="concept.93366255-8903-44af-8370-3b68c0400930" value="606720bb-4a7a-4c4c-b3b5-9a8e910758c9">
                    No
                </label>
            </field>
            <field class="patner-results">
                <div>Patner Results</div>
                <label>
                    <input id="prior-status-positive" type="radio" data-value="Positive" name="concept.df68a879-70c4-40d5-becc-a2679b174036" value="7480ebef-125b-4e0d-a8e5-256224ee31a0">
                    Positive
                </label><br/>
                <label>
                    <input id="prior-status-negative" type="radio" data-value="Negative" name="concept.df68a879-70c4-40d5-becc-a2679b174036" value="aca8224b-2f4b-46cb-b75d-9e532745d61f">
                    Negative
                </label><br/>
                
                <label>
                    <input id="prior-status-unknown" type="radio" data-value="Unknown" name="concept.df68a879-70c4-40d5-becc-a2679b174036" value="ec8e61d3-e9c9-4020-9c62-8403e14af5af">
                    Unknown
                </label>
            </field>
        </fieldset>
        <fieldset class="no-confirmation">
            <legend>Treatment</legend>
            <field>
                <label>Counselled on feeding options?</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.fb5a5471-e912-4288-8c25-750f7f88281f" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.fb5a5471-e912-4288-8c25-750f7f88281f" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
            <field>
                <label>Vitamin A supplementation?</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.c764e84f-cfb2-424a-acec-20e4fb8531b7" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.c764e84f-cfb2-424a-acec-20e4fb8531b7" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
        </fieldset>
        <fieldset>
            <legend>Outcome</legend>
            <field>
                <label for="baby-status">Status of Baby</label>
                    <select name="concept.159926AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                        <option value="">Please select status of baby</option>
                        <option value="160429AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Alive</option>
                        <option value="159AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Dead</option>
                    </select>
            </field>
            <field>
                <input type="hidden" id="referral-set" class=""/>
                <span id="referral-lbl" class="field-error" style="display: none"></span>
            </field>
             ${ui.includeFragment("maternityapp", "refferalInformation")}
        </fieldset>
    </section>
    <div id="confirmation" style="width:74.6%; min-height: 400px;">
        <span id="confirmation_label" class="title">Confirmation</span>
        <div id="confirmationQuestion" class="focused" style="margin-top:20px">
            <field style="display: inline">
                <button class="button submit confirm" style="display: none;"></button>
            </field>
            <span value="Submit" id="delivery-form-submit" class="button submit confirm" >
                <i class="icon-save small"></i>
                Save
            </span>
            
            <span class="button cancel">
                <i class="icon-remove small"></i>
                Cancel
            </span>
        </div>
    </div>
</form>
