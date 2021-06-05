<%
    ui.decorateWith("kenyaemr", "standardEmrPage", [title: "Maternity"])
	ui.includeJavascript("ehrcashier", "moment.js")
	ui.includeCss("ehrconfigs", "referenceapplication.css")
%>

<script>
    jq(function () {
        jq("#maternityTriageFormSubmitButton").on("click", function(){
            jq("#maternity-triage-form").submit();
        })
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

	form label,
	.form label {
		display: inline-block;
		padding-left: 10px;
		width: 140px;
	}

	form input,
	form textarea{
		display: inline-block;
		min-width: 76%;
		resize: none;
	}

	form select,
	form ul.select,
	.form select,
	.form ul.select {
		display: inline-block;
		min-width: 73%;
	}

	#5596AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA label,
	#1427AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA label {
		display: none;
	}

	form input:focus, form select:focus, form textarea:focus, form ul.select:focus, .form input:focus, .form select:focus, .form textarea:focus, .form ul.select:focus {
		outline: 2px none #007fff;
		box-shadow: 0 0 1px 0 #ccc !important;
	}

	form input[type="checkbox"], .form input[type="checkbox"] {
		margin-top: 4px;
		cursor: pointer;
	}
	#modal-overlay {
		background: #000 none repeat scroll 0 0;
		opacity: 0.4 !important;
	}
	.dashboard .info-header h3 {
		color: #f26522;
	}
	.send-to input[type="radio"] {
		cursor: pointer;
		margin: 4px 5px 0 0;
		-webkit-appearance: checkbox;
		-moz-appearance: checkbox;
		-ms-appearance: checkbox;
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
                <a href="${ui.pageLink('patientqueueapp', 'pacRoomQueue')}">Queue</a>
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

        <div class="tag">Maternity</div>

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

<div>
    <div style="padding-top: 15px;" class="col15 clear">
        <ul id="left-menu" class="left-menu">
            <li class="menu-item selected" visitid="54">
                <span class="menu-date">
                    <i class="icon-time"></i>
                    <span id="vistdate">23 May 2016<br> &nbsp; &nbsp; (Active since 04:10 PM)</span>
                </span>

                <div class="patient-profile" style="font-size: 0.85em; height: 50px; padding-top: 5px;">
					<i class="icon-stethoscope"></i>
					No Diagnosis
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
                    <h3>POST ABORTAL DETAILS</h3>
                </div>
                <div class="info-body" style="margin-bottom: 20px; padding-bottom: 10px;">
                    <div style="margin-bottom: 0px">
                        <label>Extraction Done</label>
                        <label style="cursor: pointer; padding-left:0px; width: 60px;">
                            <input type="radio" name="concept.159902AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1065AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" style="margin: 4px 5px 0 0;" />
                            Yes
                        </label>
                        <label style="cursor: pointer; padding-left:0px; width: 60px;">
                            <input type="radio" name="concept.159902AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" value="1066AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA" style="margin: 4px 5px 0 0;" />
                            No
                        </label>
                    </div>
                    <div>
                        ${ui.includeFragment("uicommons", "field/datetimepicker", [formFieldName: 'concept.160753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', id: '160753AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', label: 'Date', useTime: false, defaultToday: true, endDate: new Date()])}
                    </div>

                    <div>
                        <label>Notes</label>
                        <textarea name="concept.159395AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"></textarea>
                    </div>

                    <div style="margin-left: 150px; margin-top: 10px;">
                    </div>
                </div>
				
				<div class="info-header">
					<i class="icon-group"></i>
					<h3>VISIT DETAILS</h3>
				</div>
				
				<div class="info-body send-to" style="padding-bottom: 15px">
					<div>
						<label>Send To: </label>
                        <label style="padding-left:0px; width: auto; cursor: pointer;">
                            <input type="radio" name="send_for_examination" value="dff8dd54-e086-4ceb-bf47-09100354c9c2">
                            Send to Delivery Room
                        </label><br/>
						
						<label></label>
                        <label style="padding-left:0px; width: auto; cursor: pointer;">
                            <input type="radio" name="send_for_examination" value="90462a4e-a449-4c39-87b2-ddff230ec175">
                            Send to Maternity Ward
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
