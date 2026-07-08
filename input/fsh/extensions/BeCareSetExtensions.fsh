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

Extension: BeCareTeamCarePlan
Id: be-ext-careteam-careplan
Title: "CareTeam CarePlan"
Description: "The CarePlan(s) containing the actions and goals the CareTeam will carry out or pursue."
Context: CareTeam
* value[x] only Reference(CarePlan)
* value[x] 1..1
