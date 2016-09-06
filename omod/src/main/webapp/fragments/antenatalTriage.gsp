<script>
    jq(function () {
        jq("#maternityTriageFormSubmitButton").on("click", function(){
            jq("#maternity-triage-form").submit();
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
            <form method="post" id="maternity-triage-form">
                
                ${ui.includeFragment("mchapp", "antenatalDetails")}

                <div class="info-header">
                    <i class="icon-user-md"></i>
                    <h3>MATERNAL DETAILS</h3>
                </div>
                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 10px;">
                    <div>
                        <label for="concept.15de567e-8112-4895-8f00-b7cb03031928">Vagina Dilation</label>
                        <input type="text" id="concept.15de567e-8112-4895-8f00-b7cb03031928" name="concept.15de567e-8112-4895-8f00-b7cb03031928" class="number numeric-range" value="">
                        <span class="append-to-value">cm</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="concept.1439AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Fundal Height</label>
                        <input type="text" id="concept.1439AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.1439AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
                        <span class="append-to-value">cm</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>
                </div>
                <div class="info-header">
                    <i class="icon-diagnosis"></i>
                    <h3>TRIAGE DETAILS</h3>
                </div>

                <div class="info-body">
                    <input type="hidden" name="patientId" value="${patientId}" >
                    <input type="hidden" name="queueId" value="${queueId}" >
                    <div>
                        <label for="concept.5088AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Temperature</label>
                        <input type="text" id="concept.5088AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.5088AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
                        <span class="append-to-value">..&#8451;</span>
                        <span id="12464" class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Weight</label>
                        <input type="text" id="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.5089AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value=""/>
                        <span class="append-to-value">Kgs</span>
                        <span id="12482" class="field-error" style="display: none"></span>
                    </div>
                    <div>
                        <label for="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Height</label>
                        <input type="text" id="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.5090AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value=""/>
                        <span class="append-to-value">Mtrs</span>
                        <span id="12483" class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="concept.167785f7-52e6-46c1-b3a1-0f46e57a2209">Blood Sugar</label>
                        <input type="text" id="concept.167785f7-52e6-46c1-b3a1-0f46e57a2209" name="concept.167785f7-52e6-46c1-b3a1-0f46e57a2209" class="number numeric-range" value="">
                        <span class="append-to-value">mmol/L</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="systolic">Blood Pressure</label>
                        <input type="text" id="systolic" name="concept.6aa7eab2-138a-4041-a87f-00d9421492bc" class="number numeric-range" value=""  />
                        <span class="append-to-value">Systolic</span>
                        <span id="12485" class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="diastolic"></label>
                        <input type="text" id="diastolic" name="concept.5086AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value=""/>
                        <span class="append-to-value">Diastolic</span>
                        <span id="12484" class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label></label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="send_for_examination" value="11303942-75cd-442a-aead-ae1d2ea9b3eb">
                            Send to PAC Room
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="send_for_examination" value="4e87c99b-8451-4789-91d8-2aa33fe1e5f6">
                            Send to Delivery Room
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


