<script>
    jq(function () {
        jq("#delivery-form").on("click", function(){
            jq("#delivery-form").submit();
        })
    });
</script>
<div>
    <div style="padding-top: 15px;" class="col15 clear">
        <ul id="left-menu" class="left-menu">
            <li class="menu-item selected" visitid="54">
                <span class="menu-date">
                    <i class="icon-time"></i>
                    <span id="vistdate">23 May 2016<br> &nbsp; &nbsp; (Active since 04:10 PM)</span>
                </span>

                <div class="patient-profile">

                </div>



                <span class="arrow-border"></span>
                <span class="arrow"></span>
            </li>

            <li style="height: 30px;" class="menu-item" visitid="53">
            </li>
        </ul>
    </div>

    <div style="min-width: 78%" class="col16 dashboard">
        <div class="info-section">
            <form method="post" id="delivery-form">
                <input type="hidden" name="patientId" value="${patientId}" >
                <input type="hidden" name="queueId" value="${queueId}" >
                <div class="info-header">
                    <i class="icon-user-md"></i>
                    <h3>DELIVERY/MOTHER</h3>
                </div>
                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 10px;">
                    <div>
                        <label for="labour-duration">Duration of Labour</label>
                        <input type="text" id="labour-duration" name="" class="number numeric-range" value="">
                        <span class="append-to-value">hrs</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'delivery-date', label: 'Delivery Date and Time', formFieldName: 'concept.5599AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', useTime: true, defaultToday: true, endToday: true])}>
                    </div>
                    <div>
                        <label>Placenta Complete?</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            Yes
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            No
                        </label>
                    </div>
                    <div>
                        <label for="blood-loss">Blood loss</label>
                        <input type="text" id="blood-loss" name="" class="number numeric-range" value="">
                        <span class="append-to-value">mls</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label>Status after Delivery</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="160429AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            Alive
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="180BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB">
                            Dead
                        </label>
                    </div>
                    <div>
                        ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'death-audit-date', label: 'Date Maternal death audited', formFieldName: 'concept.', useTime: true, defaultToday: true, endToday: true])}>
                    </div>
                    <div>
                        <label for="delivery-complications">Delivery complications</label>
                        <select name="">
                            <option value="">Please select delivery complications</option>
                            <option value="88286d13-5d65-4ee1-81fa-4a23dc976e07">Antepartum Haemorrhage</option>
                            <option value="37c1d10f-b557-4f76-86d1-69122e2c78c9">Postpartum Haemorrhage</option>
                            <option value="8db88891-e23c-4253-9c2f-7e63259e1e3c">Eclampsia</option>
                            <option value="">Ruptured Uterus</option>
                            <option value="cdc05740-7d21-4bf3-86b3-ed5c37e1d070">Obstructed labour</option>
                            <option value="8388786c-cd97-4000-91df-b094a2641eac">Sepsis</option>
                        </select>
                    </div>
                </div>
                <div class="info-header">
                    <i class="icon-diagnosis"></i>
                    <h3>Baby</h3>
                </div>

                <div class="info-body">
                    <div>
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
                    </div>
                    <div>
                        <label>Initiation of BF within 1 Hour</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            Yes
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            No
                        </label>
                    </div>
                    <div>
                        <label for="apgar-score">APGAR Score</label>
                        <input type="text" id="apgar-score" name="" class="number numeric-range" value="">
                        <span  class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label>Tetracycline at birth</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            Yes
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            No
                        </label>
                    </div>
                    <div>
                        <label>Birth with deformities</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            Yes
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                            No
                        </label>
                    </div>
                </div>
            </form>

            <div>
                <span class="button submit confirm right" id="maternityTriageFormSubmitButton" style="margin-top: 10px; margin-right: 50px;">
                    <i class="icon-save"></i>
                    Save
                </span>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <br style="clear: both">
</div>


<div class="template-holder" style="display:none;">
    <div class="patient-profile-editor">
        <div class="info-header">
            <i class="icon-user-md"></i>
            <h3>ANTENATAL DETAILS</h3>
        </div>

        <div class="info-body" style="margin-bottom: 20px; padding-bottom: 10px;">
            <div>
                <label for="parity">Parity</label>
                <input type="text" name="concept.1053AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" id="parity" />
                <span class="append-to-value">Pregnancies</span>
            </div>

            <div>
                <label for="gravidae">Gravida</label>
                <input type="text" name="concept.5624AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" id="gravida" />
                <span class="append-to-value">Pregnancies</span>
            </div>

            <div>
                ${ui.includeFragment("uicommons", "field/datetimepicker", [formFieldName: 'concept.1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', id: '1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', label: 'L.M.P', useTime: false, defaultToday: false, endDate: new Date(), class: ['searchFieldChange', 'date-pick', 'searchFieldBlur']])}
            </div>

            <div>
                ${ui.includeFragment("uicommons", "field/datetimepicker", [formFieldName: 'concept.5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', id: '5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', label: 'E.D.D', useTime: false, defaultToday: false, class: ['searchFieldChange', 'date-pick', 'searchFieldBlur']])}
            </div>

            <div>
                <label for="gestation">Gestation</label>
                <input type="text" id="gestation">
                <span class="append-to-value">Weeks</span>
            </div>
        </div>
    </div>
</div>
<div class="">&nbsp;</div>

