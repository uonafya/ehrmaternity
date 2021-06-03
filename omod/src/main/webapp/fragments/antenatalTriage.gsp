<script>
	function isValidDate(str) {
        var d = moment(str, 'D/M/YYYY');
        var dt = moment(str, 'D MMMM YY');
        var dh = moment(str, 'YYYY-MM-DD');
        if (d == null || (!d.isValid() && !dt.isValid()&& !dh.isValid())) return false;

        var result = str.indexOf(d.format('D/M/YYYY')) >= 0
                || str.indexOf(d.format('DD/MM/YYYY')) >= 0
                || str.indexOf(d.format('D/M/YY')) >= 0
                || str.indexOf(d.format('DD/MM/YY')) >= 0
                || str.indexOf(dt.format('D MMM YYYY')) >= 0
                || str.indexOf(dt.format('DD MMMM YYYY')) >= 0
                || str.indexOf(dt.format('D MMM YY')) >= 0
                || str.indexOf(dt.format('DD MMMM YY')) >= 0
                || str.indexOf(dh.format('YYYY-MM-DD')) >= 0;
        return result;
    }
	
	function calculateExpectedDeliveryDate() {
		var lastMenstrualPeriod = jq("#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-field", document.forms[0]).val();
		var expectedDate = moment(lastMenstrualPeriod, "YYYY-MM-DD").add(280, "days");
		jq('#5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-field', document.forms[0]).val(expectedDate.format('YYYY-MM-DD'));
		jq('#5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-display', document.forms[0]).val(expectedDate.format('DD MMM YYYY'));
	}

	function calculateGestationInWeeks(){
		var lastMenstrualPeriod = moment(jq("#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-field", document.forms[0]).val(), "YYYY-MM-DD");
		var expectedDate = moment();
		var gestationInWeeks = Math.round(moment.duration(expectedDate.diff(lastMenstrualPeriod)).asWeeks());
		jq('#gestation', document.forms[0]).val(gestationInWeeks);
	}
	
    jq(function () {
        jq("#maternityTriageFormSubmitButton").on("click", function(){
            jq("#maternity-triage-form").submit();
        });
		
		jq("form").on("change", "#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", function(e){
            calculateExpectedDeliveryDate();
            calculateGestationInWeeks();
        });

        jq("form").on("change", "#gestation", function(e) {
            var gestationPeriod = jq(this).val();			
			if (!jq.isNumeric(gestationPeriod)){
				alert('Invalid');
				return false;
			}
			
            var lastMenstrualPeriod = moment().add(-gestationPeriod, "weeks");
			
            jq('#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-field', document.forms[0]).val(lastMenstrualPeriod.format('YYYY-MM-DD'));
            jq('#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA-display', document.forms[0]).val(lastMenstrualPeriod.format('DD MMM YYYY'));
            jq("#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA").change();
        });
		
		var patientProfile = JSON.parse('${patientProfile}');
        if (patientProfile.details.length > 0) {
            var patientProfileTemplate = _.template(jq("#patient-profile-template").html());
            jq(".patient-profile").append(patientProfileTemplate(patientProfile));
        } else {
            jq(".patient-profile-editor").prependTo(jq(".profile-editor"));
        }

        jq(".patient-profile").on("click", ".edit-profile", function(){
            jq(".patient-profile").empty();
            jq("<span style='margin-top: 5px; display: block;'><a href=\"#\" class=\"cancel\"><i class='icon-remove small'></i>Cancel Edit</a></span>").appendTo(jq(".patient-profile"));
            jq(".patient-profile-editor").prependTo(jq(".profile-editor"));
            for (var i = 0; i < patientProfile.details.length; i++) {
                if (isValidDate(patientProfile.details[i].value)) {
                    jq("input[name\$='"+ patientProfile.details[i].uuid +"']").val(moment(patientProfile.details[i].value, 'D/M/YYYY').format('YYYY-MM-DD')).change();
                    jq("#"+ patientProfile.details[i].uuid + "-display").val(moment(patientProfile.details[i].value, 'D/M/YYYY').format('DD MMM YYYY')).change();
                } else {
                    jq("input[name\$='"+ patientProfile.details[i].uuid +"']").val(patientProfile.details[i].value);
                }
            }
        });

        jq(".patient-profile").on("click", ".cancel", function(e){
            e.preventDefault();
            jq('.patient-profile-editor').appendTo('.template-holder');
            jq(':input','.patient-profile-editor')
              .val('')
              .removeAttr('checked')
              .removeAttr('selected');
            if (patientProfile.details.length > 0) {
                var patientProfileTemplate = _.template(jq("#patient-profile-template").html());
                jq(".patient-profile").append(patientProfileTemplate(patientProfile));
            }
            jq(this).remove();
        });		
    });
</script>

<script id="patient-profile-template" type="text/template">
    {{ _.each(details, function(profileDetail) { }}
		<span class="menu-title">
			<i class="icon-angle-right"></i>
			<span>{{=profileDetail.name}}:</span>{{=profileDetail.value}}
		</span>
    {{ }); }}
	
	<span style="border-top: 1px dotted rgb(136, 136, 136); display: block; margin-top: 5px; padding-top: 5px;">
		<a href="#" class="edit-profile">
			<i class="icon-pencil"></i>
			Edit Details
		</a>	
	</span>
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

    <div style="min-width: 77%" class="col16 dashboard">
        <div class="info-section">
            <form method="post" id="maternity-triage-form">                
                <div class="profile-editor"></div>

                <div class="info-header">
                    <i class="icon-user-md"></i>
                    <h3>MATERNAL DETAILS</h3>
                </div>
				
                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 15px;">
                    <div>
                        <label for="concept.162261AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Vagina Dilation</label>
                        <input type="text" id="concept.162261AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.162261AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
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

                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 15px;">
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
                        <label for="concept.887AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">Blood Sugar</label>
                        <input type="text" id="concept.887AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" name="concept.887AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
                        <span class="append-to-value">mmol/L</span>
                        <span  class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="systolic">Blood Pressure</label>
                        <input type="text" id="systolic" name="concept.5085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value=""  />
                        <span class="append-to-value">Systolic</span>
                        <span id="12485" class="field-error" style="display: none"></span>
                    </div>

                    <div>
                        <label for="diastolic"></label>
                        <input type="text" id="diastolic" name="concept.5086AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value=""/>
                        <span class="append-to-value">Diastolic</span>
                        <span id="12484" class="field-error" style="display: none"></span>
                    </div>
                </div>
				
				<div class="info-header">
					<i class="icon-group"></i>
					<h3>VISIT DETAILS</h3>
				</div>
				
				<div class="info-body" style="padding-bottom: 15px">
					<div>
						<label>Send Patient To</label>
                        <label style="padding-left:0px; width: auto; cursor: pointer;">
                            <input type="radio" name="send_for_examination" value="dff8dd54-e086-4ceb-bf47-09100354c9c2">
                            Delivery Room
                        </label><br/>

                        <label style="padding-left:0px; width: auto; cursor: pointer;">
                            <input type="radio" name="send_for_examination" value="072ffde2-6515-41c9-9969-1b303241ba56">
                            PAC Room
                        </label><br/>
						
						<label></label>
						<label style="padding-left:0px; width: auto; cursor: pointer;">
                            <input type="radio" name="send_for_examination" value="90462a4e-a449-4c39-87b2-ddff230ec175">
                            Maternity Ward
                        </label>
					</div>
				</div>
            </form>

            <div>
                <span class="button submit confirm right" id="maternityTriageFormSubmitButton" style="margin-top: 0px; margin-right: 30px;">
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
		${ui.includeFragment("mchapp", "antenatalDetails")}
	</div>
</div>
<div class="">&nbsp;</div>


