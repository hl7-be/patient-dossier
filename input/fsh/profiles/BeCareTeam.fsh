Alias: $BeExtRecorder = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-ext-recorder

Profile: BeCareTeam
Parent: CareTeam
Id: be-care-team
Title: "BeCareTeam"
Description: "CareTeam profile realising the BeModelCareTeam logical model. Every element of the model is represented, either as a native CareTeam element or as an extension, and flagged as Must Support."

// identifier -> Business Identifier of the CareSet
* identifier 1..* MS

// status -> registration status (base binds care-team-status, required)
// Note: the model's VS_Status (planned | active | on-hold | finished | cancelled |
// entered-in-error) differs from the R4 care-team-status value set that the base
// resource binds; the base binding is required and cannot be changed in the profile.
* status 1..1 MS

// period -> the period for which the CareSet is valid
* period 0..1 MS

// category -> the type of CareTeam (base binds care-team-category)
* category 1..1 MS

// name -> the name given to the CareTeam
* name 0..1 MS

// participant -> the participants included in the CareTeam
* participant 1..* MS
* participant.member 1..1 MS
* participant.role MS

// managingOrganization -> the organization responsible for the CareTeam
* managingOrganization 0..1 MS

// condition -> the condition/problem for which the CareTeam was assembled
// R4 carries this via reasonReference (Reference(Condition))
* reasonReference 0..* MS

// patient -> the subject of the CareSet
* subject 1..1 MS

// telecom -> the contact details to reach the CareTeam
* telecom 0..* MS

// note -> additional free-text information
* note 0..* MS

// Model elements with no native R4 CareTeam equivalent -> extensions
// author -> be-core BeExtRecorder
* extension contains
    BeCareSetRecordedDate named recordedDate 1..1 MS and
    BeCareSetCreated named created 1..1 MS and
    $BeExtRecorder named author 1..1 MS and
    BeCareTeamCarePlan named carePlan 0..* MS
