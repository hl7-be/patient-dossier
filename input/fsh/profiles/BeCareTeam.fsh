// =============================================================================
// *** NOT TO MERGE ***
//
// The CarePlan / CareTeam CareSet artifacts live in hl7-be/patient-care, which
// is where the updated profiles remain. This copy is kept on the careplan-team
// branch only so the 5 November 2026 WG decisions stay traceable here, and must
// not be merged into main.
//
// Decisions applied to both copies:
//   patient-dossier#35  the CareTeam -> CarePlan link is removed; the reference
//                       is one-directional, on the native CarePlan.careTeam.
//   patient-dossier#28  participant.role is limited to 0..1 and
//                       participant.period is Must Support.
//
// Ids are deliberately NOT aligned between the two repositories: patient-care
// keeps be-careteam / be-care-plan, this copy keeps be-care-team.
// =============================================================================

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
* category 0..* MS

// name -> the name given to the CareTeam
* name 0..1 MS

// participant -> the participants included in the CareTeam
* participant 1..* MS
* participant.member only Reference(BePatient or BePractitioner or BeOrganization or CareTeam or BePractitionerRole or RelatedPerson)
* participant.member 1..1 MS
// role -> the role the participant plays in the CareTeam.
// Limited to 0..1 (WG 2026-11-05, #28): one role per participant entry, so that
// participant.period below is unambiguously the period of that role.
* participant.role 0..1 MS

// period -> the period during which the participant holds that role.
// Must Support (WG 2026-11-05, #28): required by the ZOCO business validation,
// which needs the period a person was active in the role.
* participant.period 0..1 MS


// managingOrganization -> the organization responsible for the CareTeam
* managingOrganization only Reference(BeOrganization)
* managingOrganization 0..1 MS

// condition -> the condition/problem for which the CareTeam was assembled
// R4 carries this via reasonReference (Reference(Condition))
* reasonReference 0..* MS

// patient -> the subject of the CareSet
* subject only Reference(BePatient)
* subject 1..1 MS

// telecom -> the contact details to reach the CareTeam
* telecom 0..* MS

// note -> additional free-text information
* note 0..* MS

// Model elements with no native R4 CareTeam equivalent -> extensions
// author -> be-core BeExtRecorder
* extension contains
    BeCareSetRecordedDate named recordedDate 1..1 MS and
    BeCareSetCreated named created 0..1 MS and
    $BeExtRecorder named author 1..1 MS
