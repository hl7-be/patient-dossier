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

// Reusable CareSet metadata extensions for elements that have no native
// equivalent on the R4 resources and no existing be-core extension.
//
// Note: the "Author" and "Note" CareSet elements are covered by the be-core
// extensions BeExtRecorder (be-ext-recorder) and BeExtSimpleNote
// (be-ext-simple-note) respectively, so no local extensions are defined here
// for those - the profiles reference the be-core ones directly.

Extension: BeCareSetRecordedDate
Id: be-ext-careset-recorded-date
Title: "CareSet RecordedDate"
Description: "Recording date by the Author or Recorder (date of last update). Coupled with the Business Identifier it enables CareSet history management, guaranteeing access to the latest version of the content."
Context: EpisodeOfCare, CarePlan, CareTeam
* value[x] only dateTime
* value[x] 1..1

Extension: BeCareSetCreated
Id: be-ext-careset-created
Title: "CareSet Created"
Description: "The moment the CareSet was first created."
Context: EpisodeOfCare, CareTeam
* value[x] only dateTime
* value[x] 1..1

// Note: there is deliberately no CareTeam -> CarePlan extension. The reference
// between the two is kept in one direction only (WG 2026-11-05, #35), on the
// native CarePlan.careTeam element, which BeCarePlan constrains to BeCareTeam.
