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

                <div class="info-header">
                    <i class="icon-user-md"></i>
                    <h3>POST ABORTAL CARE</h3>
                </div>
                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 10px;">
                    <div style="margin-bottom: 20px">
                        <label>Extraction Done?</label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="concept.159902AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="4536f271-5430-4345-b5f7-37ca4cfe1553">
                            Yes
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="concept.159902AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="606720bb-4a7a-4c4c-b3b5-9a8e910758c9">
                            No
                        </label>
                    </div>
                    <div>
                        ${ui.includeFragment("uicommons", "field/datetimepicker", [formFieldName: 'concept.2d32b641-83ea-4cb5-be77-bc2b5c250b66', id: '2d32b641-83ea-4cb5-be77-bc2b5c250b66', label: 'Date', useTime: false, defaultToday: false, endDate: new Date(), class: ['searchFieldChange', 'date-pick', 'searchFieldBlur']])}
                    </div>

                    <div>
                        <label>Notes</label>
                        <textarea name="concept.159395AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"></textarea>
                    </div>

                    <div style="margin-left: 150px; margin-top: 10px;">
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="send_for_examination" value="daea450b-4c2c-49ea-a241-afa152b52145">
                            Send to Delivery Room
                        </label>
                        <label style="padding-left:0px; width: auto;">
                            <input type="radio" name="send_for_examination" value="7bda0f2c-585d-4671-8917-2c847f68d11b">
                            Send to Maternity Ward
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


