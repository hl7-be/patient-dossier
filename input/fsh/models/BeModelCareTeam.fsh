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

Logical: BeModelCareTeam
Id: be-model-care-team
Title: "BeCareTeam model"
Description: "Logical model for the CareTeam CareSet - aggregates the persons/organizations involved in the care delivered to a patient, often around one or more specific health problems. Bundles the 'who' around the patient, not the what, why, where, how or when."
Characteristics: #can-be-target

// Business Identifier van de CareSet CareTeam
* identifier 1..* Identifier "Business Identifier of the CareTeam CareSet"

// De koppeling tussen Business Identifier en Recorded Date
* recordedDate 1..1 dateTime "Recording date, coupled to the Business Identifier" "Guarantees that the latest version of the CareSet is shown"

// Is de zorgprofessional die de verantwoordelijkheid neemt voor wat geregistreerd werd
* author 1..1 Reference "The healthcare professional (recorder) who takes responsibility for what was recorded"

// Is het moment waarop de CareSet werd aangemaakt
* created 0..1 dateTime "Moment the CareSet was created"

// Duidt de status van de registratie van de CareSet. Zie VS_Status
* status 1..1 code "Registration status of the CareSet" "planned | active | on-hold | finished | cancelled | entered-in-error"

// Geeft de periode weer waarin de CareSet geldig is
* period 0..1 Period "The period for which the CareSet is valid"

// Geeft het soort CareTeam weer. Zie VS_CareTeam_Category
* category 0..* CodeableConcept "Indicates the type of CareTeam"
* category from http://hl7.org/fhir/ValueSet/care-team-category (extensible)

// De naam die aan het CareTeam wordt gegeven
* name 0..1 string "The name given to the CareTeam"

// De deelnemers die opgenomen zijn in het CareTeam. Patient/Practitioner/Organization/CareTeam
* participant 1..* BackboneElement "The participants included in the CareTeam"
  * member 1..1 Reference "The participant reference (BePatient/BePractitioner/BeOrganization/BeCareTeam/BeRelatedPerson/BePractitionerRole)"
  * role 0..1 CodeableConcept "The role of the participant in the team"
  * period 0..1 Period "The period during which the participant holds that role"

// De organisatie die verantwoordelijk is voor het CareTeam. Verwijst naar Organization
* managingOrganization 0..1 Reference "The organization responsible for the CareTeam"

// De aandoening/probleem waarvoor het CareTeam werd samengesteld. Verwijst naar Condition
* condition 0..* Reference "The condition/problem for which the CareTeam was assembled"

// Note: there is deliberately no CarePlan element here. The reference between
// CareTeam and CarePlan is kept in one direction only (WG 2026-11-05, #35),
// from CarePlan to CareTeam.

// De persoon die het onderwerp is. Verwijst naar de resource Patient
* patient 1..1 Reference "The person who is the subject of the records in this CareSet"

// De contactgegevens waarmee het CareTeam te bereiken is
* telecom 0..* ContactPoint "The contact details to reach the CareTeam"

// Bijkomende informatie die relevant is voor deze CareSet, in vrije tekst
* note 0..* Annotation "Additional free-text information relevant to this CareSet"
