<%
	ui.decorateWith("kenyaemr", "standardEmrPage", [title: "Maternity"])
	ui.includeJavascript("ehrcashier", "moment.js")
	ui.includeCss("ehrconfigs", "referenceapplication.css")

    ui.includeJavascript("uicommons", "handlebars/handlebars.min.js", Integer.MAX_VALUE - 1)
    ui.includeJavascript("uicommons", "navigator/validators.js", Integer.MAX_VALUE - 19)
    ui.includeJavascript("uicommons", "navigator/navigator.js", Integer.MAX_VALUE - 20)
    ui.includeJavascript("uicommons", "navigator/navigatorHandlers.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorModels.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/navigatorTemplates.js", Integer.MAX_VALUE - 21)
    ui.includeJavascript("uicommons", "navigator/exitHandlers.js", Integer.MAX_VALUE - 22)
%>

<script>
    var NavigatorController;
	var emrMessages = {};
	
    emrMessages["requiredField"] = "Ensure Required Fields have been properly filled";
	
    jq(function () {
		jq('.mother-details input').change(function(){
			var sender = jq(this);
			var select = jq('input[name="concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"]:checked').val();
			
			var timeOfDelivery = jq('#delivery-date-field').val();
			var labourDuration = jq('#labour-duration').val();
			var deliveryMode = jq('#delivery-mode').val();
			var bloodLoss = jq('#blood-loss').val();
			
			if (timeOfDelivery=="" || labourDuration=="" || deliveryMode=="" || bloodLoss==""){
				jq('#mother-details-set').val('');
			}
			else{
				jq('#mother-details-set').val('SET');
				jq('#mother-details-lbl').hide();
			}
			
			if (sender.attr('name') == 'concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'){
				if (select == '180BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB'){
					jq('.death-audited-div').show(300);
				}else{
					jq('.death-audited-div').hide(300);
					jq('#death-audit-date-field').val('');
					jq('#death-audit-date-display').val('');
				}
			}
		});
		
		jq('.baby-details input').change(function(){
			var sender = jq(this);
			
			var birthOutcome = jq('#birth-outcome').val();
			var apgarScore = jq('#apgar-score').val();
			var bfInitiation = jq('input[name="concept.161543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"]:checked').length;
			var birthNotification = jq('#birth-notification-number').val();
			
			if (birthOutcome=="" || apgarScore=="" || birthNotification=="" || bfInitiation=="0"){
				jq('#baby-details-set').val('');
			}
			else{
				jq('#baby-details-set').val('SET');
				jq('#baby-details-lbl').hide();
			}			
		});

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
		
		
        NavigatorController = new KeyboardController();
    });
</script>

<style>
	.toast-item {
		background-color: #222;
	}

	.name {
		color: #f26522;
	}

	#breadcrumbs a, #breadcrumbs a:link, #breadcrumbs a:visited {
		text-decoration: none;
	}

	.new-patient-header .demographics .gender-age {
		font-size: 14px;
		margin-left: -55px;
		margin-top: 12px;
	}

	.new-patient-header .demographics .gender-age span {
		border-bottom: 1px none #ddd;
	}

	.new-patient-header .identifiers {
		margin-top: 5px;
	}

	.tag {
		padding: 2px 10px;
	}

	.tad {
		background: #666 none repeat scroll 0 0;
		border-radius: 1px;
		color: white;
		display: inline;
		font-size: 0.8em;
		padding: 2px 10px;
	}

	.status-container {
		padding: 5px 10px 5px 5px;
	}

	.catg {
		color: #363463;
		margin: 35px 10px 0 0;
	}

	.print-only {
		display: none;
	}

	.button-group {
		display: inline-block;
		position: relative;
		vertical-align: middle;
	}

	.button-group > .button:first-child:not(:last-child):not(.dropdown-toggle) {
		border-bottom-right-radius: 0;
		border-top-right-radius: 0;
	}

	.button-group > .button:first-child {
		margin-left: 0;
	}

	.button-group > .button:hover, .button-group > .button:focus, .button-group > .button:active, .button-group > .button.active {
		z-index: 2;
	}

	.button-group > .button {
		border-radius: 5px;
		float: left;
		position: relative;
	}

	.button.active, button.active, input.active[type="submit"], input.active[type="button"], input.active[type="submit"], a.button.active {
		background: #d8d8d8 none repeat scroll 0 0;
		border-color: #d0d0d0;
	}

	.button-group > .button:not(:first-child):not(:last-child) {
		border-radius: 0;
	}

	.button-group > .button {
		border-radius: 5px;
		float: left;
		position: relative;
	}

	.button-group > .button:last-child:not(:first-child) {
		border-bottom-left-radius: 0;
		border-top-left-radius: 0;
	}

	.button-group .button + .button, .button-group .button + .button-group, .button-group .button-group + .button, .button-group .button-group + .button-group {
		margin-left: -1px;
	}

	ul.left-menu {
		border-style: solid;
	}

	.col15 {
		display: inline-block;
		float: left;
		max-width: 22%;
		min-width: 22%;
	}

	.col16 {
		display: inline-block;
		float: left;
		width: 730px;
	}

	#date-enrolled label {
		display: none;
	}

	.add-on {
		color: #f26522;
	}

	.append-to-value {
		color: #999;
		float: right;
		left: auto;
		margin-left: -200px;
		margin-top: 13px;
		padding-right: 55px;
		position: relative;
	}

	.menu-title span {
		display: inline-block;
		width: 65px;
	}

	span a:hover {
		text-decoration: none;
	}

	form label{
		display: inline-block;
		padding-left: 10px;
		width: 140px;
	}
	form .baby-details label,
	form .mother-details label{
		display: inline-block;
		padding-left: 10px;
		width: 175px;
	}

	form input[type="text"],
	form textarea {
		display: inline-block;
		min-width: 70%;
	}	
	form input[type="radio"] {
		cursor: pointer;
		margin: 4px 5px 0 0;
		-webkit-appearance: checkbox;
		-moz-appearance: checkbox;
		-ms-appearance: checkbox;
	}
	form input[type="checkbox"], .form input[type="checkbox"] {
		margin-top: 4px;
		cursor: pointer;
	}
	form input:focus, form select:focus, form textarea:focus, form ul.select:focus, .form input:focus, .form select:focus, .form textarea:focus, .form ul.select:focus {
		outline: 2px none #007fff;
		box-shadow: 0 0 1px 0 #ccc !important;
	}

	form select,
	form ul.select,
	.form select,
	.form ul.select {
		display: inline-block;
		width: 70%;
	}
	#5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA label,
	#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA label {
		display: none;
	}
	#modal-overlay {
		background: #000 none repeat scroll 0 0;
		opacity: 0.4 !important;
	}
	.simple-form-ui section, .simple-form-ui #confirmation, .simple-form-ui form section, .simple-form-ui form #confirmation {
		background: #fff none repeat scroll 0 0;
		width: 75.6%;
	}
	.simple-form-ui section fieldset select:focus, .simple-form-ui section fieldset input:focus, .simple-form-ui section #confirmationQuestion select:focus, .simple-form-ui section #confirmationQuestion input:focus, .simple-form-ui #confirmation fieldset select:focus, .simple-form-ui #confirmation fieldset input:focus, .simple-form-ui #confirmation #confirmationQuestion select:focus, .simple-form-ui #confirmation #confirmationQuestion input:focus, .simple-form-ui form section fieldset select:focus, .simple-form-ui form section fieldset input:focus, .simple-form-ui form section #confirmationQuestion select:focus, .simple-form-ui form section #confirmationQuestion input:focus, .simple-form-ui form #confirmation fieldset select:focus, .simple-form-ui form #confirmation fieldset input:focus, .simple-form-ui form #confirmation #confirmationQuestion select:focus, .simple-form-ui form #confirmation #confirmationQuestion input:focus{
		outline: 0px none #007fff;
	}	
	.simple-form-ui .field-error, 
	.simple-form-ui form .field-error {
		border-bottom: 1px solid;
		padding-left: 10px;
		width: 93%;
	}
	span.required{
		color: #ff0000;
		float: right;
		margin-right: 5px;
	}
	#delivery-date label{
		display: none;
	}
	.onerow {
		clear: both;
		padding: 0 10px;
	}
	.testbox {
		background-color: rgba(0, 0, 0, 0.01);
		border: 1px solid rgba(51, 51, 51, 0.1);
		margin: 0 0 15px 5px;
		min-height: 130px;
		width: 100%;
	}
	.testbox div {
		background: #5b57a6 none repeat scroll 0 0;
		border-bottom: 1px solid rgba(51, 51, 51, 0.1);
		color: #fff;
		margin: -1px;
		padding: 2px 15px;
	}
	.floating-controls {
		margin-top: 5px;
		padding: 0 !important;
	}
	.floating-controls input {
		cursor: pointer;
		float: none !important;
	}
	.floating-controls label {
		cursor: pointer;
	}
	.floating-controls span {
		color: #f26522;
	}
	.floating-controls textarea {
		resize: none;
	}
	.info-header h3 {
		color: #f26522;
	}
	.col1, .col2, .col3, .col4, .col5, .col6, .col7, .col8, .col9, .col10, .col11, .col12 {
		float: left;
	}
	.form-horizontal{
		display: flex;
		flex-wrap: wrap;
	}
	form section>*nth-child(1){
       display: flex;
		flex-wrap: wrap;
	}
	form section>*nth-child(2){
		display: flex;
		flex-wrap: wrap;
	}
</style>


<div class="clear"></div>

<div>
    <div class="example">
        <ul id="breadcrumbs">
            <li>
                <a href="${ui.pageLink('referenceapplication', 'home')}">
                <i class="icon-home small"></i></a>
            </li>

            <li>
                <i class="icon-chevron-right link"></i>
                <a href="${ui.pageLink('patientqueueapp', 'deliveryRoomQueue')}">Delivery Room</a>
            </li>

            <li>
                <i class="icon-chevron-right link"></i>
                ${title}
            </li>
        </ul>
    </div>
</div>

<div class="patient-header new-patient-header">
    <div class="demographics">
        <h1 class="name">
            <span id="surname">${patient.familyName},<em>surname</em></span>
            <span id="othname">${patient.givenName} ${patient.middleName ? patient.middleName : ''} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>other names</em>
            </span>

            <span class="gender-age">
                <span>
                    ${gender}
                </span>
                <span id="agename"></span>
            </span>
        </h1>

        <br/>

        <div id="stacont" class="status-container">
            <span class="status active"></span>
            Visit Status
        </div>

        <div class="tag">Outpatient</div>

        <div class="tad" id="lstdate">Last Visit: ${ui.formatDatePretty(previousVisit)}</div>
    </div>

    <div class="identifiers">
        <em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Patient ID</em>
        <span>${patient.getPatientIdentifier()}</span>
        <br>

        <div class="catg">
            <i class="icon-tags small" style="font-size: 16px"></i><small>Category:</small> ${patientCategory}
        </div>
    </div>
</div>

<form method="post" class="simple-form-ui" id="delivery-form">
    <section class="form-horizontal">
        <span class="title">Delivery Details</span>
        <input type="hidden" name="patientId" value="${patientId}" >
        <input type="hidden" name="queueId" value="${queueId}" >
        <fieldset class="no-confirmation mother-details">
            <legend>Details of Mother</legend>
			<field>
				<input type="hidden" id="mother-details-set" class="required" />
				<span id="mother-details-lbl" class="field-error" style="display: none"></span>
			</field>
			
            <div>
				<label for="delivery-date-display">Time of Delivery<span class="required">*</span></label>
				${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'delivery-date', label: 'Time of Delivery', formFieldName: 'concept.5599AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', useTime: true, defaultToday: false, endToday: true])}
            </div>
			
            <div>
				<label for="labour-duration">Duration of Labour<span class="required">*</span></label>
				<input type="text" id="labour-duration" name="" class="number numeric-range" value="">
				<span class="append-to-value">Hrs</span>
            </div>			
			
            <div>
				<label for="delivery-mode">Mode of Delivery<span class="required">*</span></label>
				<select id="delivery-mode" name="concept.5630AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					<option value="">- SELECT OPTION -</option>					
					<% deliveryModesList.each{ %>
						<option value="${it.uuid}">${it.value}</option>						
					<% } %>
				</select>
            </div>
			
            <div>
				<label for="blood-loss">Blood Loss<span class="required">*</span></label>
				<input type="text" id="blood-loss" name="concept.161928AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="">
				<span class="append-to-value">Mls</span>
            </div>
			
            <div>
				<label>Placenta Complete?</label>
				<label style="padding-left:0px; width: auto; cursor: pointer">
					<input type="radio" name="concept.163455AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					Yes
				</label><br/>
				
				<label>&nbsp;</label>
				<label style="padding-left:0px; width: auto; cursor: pointer">
					<input type="radio" name="concept.163455AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					No
				</label>
            </div>			
			
            <div>
				<label for="delivery-complications">Delivery Complications</label>
				<select name="concept.144438AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					<option value="">- SELECT OPTION -</option>
					<option value="">NO COMPLICATIONS</option>
					<% deliveryComplicationsList.each{ %>
						<option value="${it.uuid}">${it.value}</option>						
					<% } %>
				</select>
            </div>
			 
            <div>
				<label>Mother's Status</label>
				<label style="padding-left:0px; width: auto; cursor: pointer">
					<input type="radio" name="concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="160429AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					Alive
				</label><br/>
				
				<label>&nbsp;</label>
				<label style="padding-left:0px; width: auto; cursor: pointer">
					<input type="radio" name="concept.160085AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="180BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB">
					Dead
				</label>
            </div>
			
            <div class='death-audited-div' style="display: none">
                ${ui.includeFragment("uicommons", "field/datetimepicker", [id: 'death-audit-date', label: 'Date Death Audited', formFieldName: 'concept.b7db90da-b845-4726-a39e-8ab6632281cf', useTime: false, defaultToday: false, endToday: true])}
            </div>
			
        </fieldset>
		
        <fieldset class="no-confirmation baby-details">
            <legend>Details of Baby</legend>
			<field>
				<input type="hidden" id="baby-details-set" class="required" />
				<span id="baby-details-lbl" class="field-error" style="display: none"></span>
			</field>
			
			<div>
				<label for="birth-outcome">Birth Outcome<span class="required">*</span></label>
				<select id="birth-outcome" name="concept.159917AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
					<option value="">- SELECT OPTION -</option>
					<% birthOutcomesList.each{ %>
						<option value="${it.uuid}">${it.value}</option>						
					<% } %>
				</select>
            </div>
			
            <div>
                <label for="birth-notification-number">Birth Notification<span class="required">*</span></label>
                <input id="birth-notification-number" type="text" name="" class="number numeric-range" value="" placeholder="Birth Notification Number">
            </div>
			
            <div>
                <label>Initiation of BF<span class="required">*</span></label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.161543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Within 1 hour
                </label><br/>
				
				<label>&nbsp;</label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.161543AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Not within the hour
                </label>
            </div>
			
            <div>
                <label for="apgar-score">APGAR Score<span class="required">*</span></label>
                <input type="text" id="apgar-score" name="concept.1504AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" class="number numeric-range" value="" placeholder="APGAR Score">
            </div>
			
            <div>
                <label>Tetracycline at birth</label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.112d5f03-8f9d-450b-bfc2-00ac13d96dd8" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Given
                </label><br/>
				
				<label>&nbsp;</label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.112d5f03-8f9d-450b-bfc2-00ac13d96dd8" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Not Given
                </label>
            </div>
			
            <div style="border-top: 1px solid #eee; margin-top: 6px;">
                <label>Birth with deformities</label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.0285b54b-8ad8-46ae-a537-fe179c7ebadd" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label><br/>
				
				<label>&nbsp;</label>
                <label style="padding-left:0px; width: auto; cursor: pointer">
                    <input type="radio" name="concept.0285b54b-8ad8-46ae-a537-fe179c7ebadd" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </div>
        </fieldset>
    </section>
	
    <section class="form-horizontal">
        <span class="title">Clinical Notes</span>
        <fieldset class="no-confirmation">
            <legend>PMTCT Information</legend>
			
			<div class="onerow floating-controls hiv-info">
				<div class="col4" style="width: 33%; margin: 0 1% 0 0">
					<div class="testbox">
						<div>Prior Known Status</div>
						<label>
							<input id="prior-status-positive" type="radio" data-value="Positive" name="concept.86f816e4-d093-4e8e-93e3-be2a98c264ac" value="703AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Positive
						</label><br/>

						<label>
							<input id="prior-status-negative" type="radio" data-value="Negative" name="concept.86f816e4-d093-4e8e-93e3-be2a98c264ac" value="664AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Negative
						</label><br/>

						<label>
							<input id="prior-status-unknown" type="radio" data-value="Unknown" name="concept.86f816e4-d093-4e8e-93e3-be2a98c264ac" value="1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Unknown
						</label>
					</div>
				</div>
				
				<div class="col4" style="width: 33%; margin: 0 1% 0 0">
					<div class="testbox">
						<div>HIV Tested in Maternity</div>
						
						<label>
							<input id="couple-counselled" type="radio" data-value="Yes" name="concept.e51dfd50-8e09-4202-815c-ddcb9d5cad8a" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Yes
						</label><br/>
						
						<label>
							<input id="couple-counselled" type="radio" data-value="No" name="concept.e51dfd50-8e09-4202-815c-ddcb9d5cad8a" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							No
						</label>
					</div>
				</div>
				
				<div class="col4 last" style="width: 32%;">
					<div class="testbox anc-results">
						<div>VDRL/RPR Results</div>
						<label>
							<input id="prior-status-positive" type="radio" data-value="Positive" name="concept.299AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="703AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Positive
						</label><br/>

						<label>
							<input id="prior-status-negative" type="radio" data-value="Negative" name="concept.299AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="664AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Negative
						</label><br/>

						<label>
							<input id="prior-status-unknown" type="radio" data-value="Unknown" name="concept.299AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1067AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
							Unknown
						</label>
					</div>
				</div>				
			</div>			
			<div class="clear"></div>
			
			
			
			
			
            
           
        </fieldset>
        <fieldset class="no-confirmation">
            <legend>Treatment</legend>
            <field>
                <label>Counselled on feeding options?</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.5526AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.5526AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    No
                </label>
            </field>
            <field>
                <label>Vitamin A supplementation?</label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.161534AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    Yes
                </label>
                <label style="padding-left:0px; width: auto;">
                    <input type="radio" name="concept.161534AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
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
