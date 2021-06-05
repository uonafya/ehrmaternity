<script>
    jq(function(){
        jq("#availableReferral").on("change", function (){
            selectReferrals(jq( "#availableReferral" ).val());
        });
    });

    function selectReferrals(selectedReferral){
        if(selectedReferral == 1){
            jq("#internalRefferalDiv").show();
            jq("#externalRefferalDiv").hide();
            jq("#externalRefferalFac").hide();
            jq("#externalRefferalRsn").hide();
            jq("#externalRefferalSpc").hide();
            jq("#externalRefferalCom").hide();
        }else if(selectedReferral == 2){
            jq("#internalRefferalDiv").hide();
            jq("#externalRefferalDiv").show();
            jq("#externalRefferalFac").show();
            jq("#externalRefferalRsn").show();
            jq("#externalRefferalCom").show();

            jq('#referralReason').change();
        }
        else{
            jq("#internalRefferalDiv").hide();
            jq("#externalRefferalDiv").hide();
            jq("#externalRefferalFac").hide();
            jq("#externalRefferalRsn").hide();
            jq("#externalRefferalSpc").hide();
            jq("#externalRefferalCom").hide();
        }
    }
</script>


    <div class="label title-label" style="width: auto; border-bottom: 1px solid rgb(221, 221, 221); padding: 20px 0px 2px 10px;">Referral Options</span></div>

    <div class="onerow">
        <div class="col4">
            <label for="availableReferral">Referral Available</label>
            <select id="availableReferral" name="availableReferral">
                <option value="0">Select Option</option>
                <option value="1">Internal Referral</option>
                <option value="2">External Referral</option>
            </select>
        </div>

        <div class="col4">
            <div id="internalRefferalDiv" style="display: none">
                <label for="internalRefferal">Internal Referral</label>
                <select id="internalRefferal" name="internalRefferal">
                    <option value="0">Select Option</option>
                    <% if (internalReferrals != null || internalReferrals != "") { %>
                    <% internalReferrals.each { internalReferral -> %>
                    <option value="${internalReferral.uuid}" >${internalReferral.label}</option>
                    <% } %>
                    <% } %>
                </select>
            </div>

            <div id="externalRefferalDiv" style="display: none">
                <label> External Referral</label>
                <select id="externalRefferal" name="concept.477a7484-0f99-4026-b37c-261be587a70b">
                    <option value="0">Select Option</option>
                    <% if (externalReferrals != null || externalReferrals != "") { %>
                    <% externalReferrals.each { externalReferral -> %>
                    <option value="${externalReferral.uuid}" >${externalReferral.label}</option>
                    <% } %>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="col4 last">
            <div id="externalRefferalFac" style="display: none">
                <label>Facility</label>
                <input type="text" id="referralFacility" name="concept.161562AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
            </div>
        </div>
    </div>

    <div class="onerow">
        <div class="col4">
            <div id="externalRefferalRsn" style="display: none">
                <label for="referralReason">Referral Reason</label>
                <select id="referralReason" name="concept.1887AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
                    <option value="0">Select Option</option>
                    <% if (referralReasons != null || referralReasons != "") { %>
                    <% referralReasons.each { referralReason -> %>
                    <option value="${referralReason.uuid}" >${referralReason.label}</option>
                    <% } %>
                    <% } %>
                </select>
            </div>
        </div>

        <div class="col4 last" style="width: 65%;">
            <div id="externalRefferalSpc" style="display: none">
                <label for="specify" style="width: 200px">If Other, Please Specify</label>
                <input id ="specify" type="text" name="" placeholder="Please Specify" style="display: inline;">
            </div>
        </div>
    </div>

    <div class="onerow">
        <div id="externalRefferalCom" style="display: none">
            <label for="comments">Comment</label>
            <textarea id="comments" name="comment.477a7484-0f99-4026-b37c-261be587a70b" style="width: 95.7%; resize: none;"></textarea>
        </div>
    </div>

<div class="label title-label" style="width: auto; border-bottom: 1px solid rgb(221, 221, 221); padding: 20px 0px 2px 10px;">Status of the Baby</span></div>
<select id="babyStatus" name="concept.159926AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA">
    <option value="0">Select Baby Status</option>
    <% if (babyStatusList != null || babyStatusList != "") { %>
        <% babyStatusList.each { babyStatus -> %>
            <option value="${babyStatus.answerConcept.uuid}">${babyStatus.answerConcept.name}</option>
        <%}%>
    <%}%>
</select>
<div class="label title-label" style="width: auto; border-bottom: 1px solid rgb(221, 221, 221); padding: 20px 0px 2px 10px;">Discharge date</span></div>
${ui.includeFragment("uicommons", "field/datetimepicker", [formFieldName: 'concept.1641AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', id: '1641AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA', label: 'Date', useTime: false, defaultToday: false, endDate: new Date(), class: ['searchFieldChange', 'date-pick', 'searchFieldBlur']])}
