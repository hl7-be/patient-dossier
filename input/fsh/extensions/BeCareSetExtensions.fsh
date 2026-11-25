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
