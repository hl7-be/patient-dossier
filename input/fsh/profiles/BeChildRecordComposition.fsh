Profile: BeChildRecordComposition
Parent: Composition
Id: BeChildRecordComposition
Title: "Child Record Composition"

* author 1.. MS
* author only Reference(BePractitioner or BeOrganization)
* date 1.. MS


* section ^slicing.discriminator[0].type = #pattern
* section ^slicing.discriminator[=].path = "code"
* section ^slicing.ordered = false
* section ^slicing.rules = #open
* section ^short = "Sections composing the IPS"
* section ^definition = "The root of the sections that make up the IPS composition."
* section.title 1..1 MS
* section.text 1.. MS
* section.section ..0 // No subsections

* section contains
    pregnancyDetails 1..1 MS and
    neonatalHearingScreening 0..1 and
    refusalOfHearingTest 0..1 and
    severeHeadTrauma 0..1 and
    eyeScreening 0..1 and
    eyeResults 0..1 and
    inTreatmentWithOphthalmologist 0..1


* section[pregnancyDetails]
  * ^short = "Pregnancy details section"
  * ^definition = "This section contains details about the pregnancy."
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(BePregnancyDuration or BePregnancyCMVInfection or BeBacterialMeningitis)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "Pregnancy details entry in the pregnancy details section"
  * entry ^definition = "An entry in the pregnancy details section of the child record composition."
  * entry contains pregnancyDuration 0..1 and pregnancyCMVInfection 0..1 and bacterialMeningitis 0..1

  * entry[pregnancyDuration] only Reference(BePregnancyDuration)
  * entry[pregnancyDuration] MS

  * entry[pregnancyCMVInfection] only Reference(BePregnancyCMVInfection)
  * entry[pregnancyCMVInfection] MS

  * entry[bacterialMeningitis] only Reference(BeBacterialMeningitis)
  * entry[bacterialMeningitis] MS



* section[neonatalHearingScreening]
  * ^short = "Neonatal hearing screening section"
  * ^definition = "This section contains details about the neonatal hearing screening."
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(BeNeonatalHearingScreening or BeNeonatalHearingScreeningLeft or BeNeonatalHearingScreeningRight)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "Neonatal hearing screening entries"
  * entry ^definition = "Entries for neonatal hearing screening including main observation and left/right ear results."
  * entry contains neonatalHearingScreening 0..* and neonatalHearingScreeningLeft 0..1 and neonatalHearingScreeningRight 0..1

  * entry[neonatalHearingScreening] only Reference(BeNeonatalHearingScreening)
  * entry[neonatalHearingScreening] MS

  * entry[neonatalHearingScreeningLeft] only Reference(BeNeonatalHearingScreeningLeft)
  * entry[neonatalHearingScreeningLeft] MS

  * entry[neonatalHearingScreeningRight] only Reference(BeNeonatalHearingScreeningRight)
  * entry[neonatalHearingScreeningRight] MS



// * section[refusalOfHearingTest]
//   * ^short = "Refusal of hearing test section"
//   * ^definition = "This section contains details about the refusal of hearing test."
//   * emptyReason MS
//   * code 1..
//   * code = #1111111
//   * entry only Reference(BeRefusalOfHearingTest)
//   * entry ^slicing.discriminator[0].type = #profile
//   * entry ^slicing.discriminator[=].path = "resolve()"
//   * entry ^slicing.rules = #open
//   * entry ^short = "Pregnancy details entry in the pregnancy details section"
//   * entry ^definition = "An entry in the pregnancy details section of the child record composition."




* section[severeHeadTrauma]
  * ^short = "Severe head trauma section"
  * ^definition = "This section contains details about severe head trauma."
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(BeSevereHeadTrauma)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "Severe head trauma entry in the severe head trauma section"
  * entry ^definition = "An entry in the severe head trauma section of the child record composition."




* section[eyeScreening]
  * ^short = "Eye screening section"
  * ^definition = "This section contains details about eye screening."
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(BeEyeScreening)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "Eye screening entry in the eye screening section"
  * entry ^definition = "An entry in the eye screening section of the child record composition."


* section[eyeResults]
  * ^short = "Eye results section"
  * ^definition = "This section contains details about eye results."
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(EyeResultsInspectionPupilAbnormal or EyeResultsEyeMovementAndPosition or EyeResultsEyeRemarks)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "Eye results entry in the eye results section"
  * entry ^definition = "An entry in the eye results section of the child record composition."




* section[inTreatmentWithOphthalmologist]
  * ^short = "In treatment with ophthalmologist section"
  * ^definition = "This section contains details about treatment with an ophthalmologist"
  * emptyReason MS
  * code 1..
  * code = #1111111
  * entry only Reference(InTreatmentWithOphthalmologist)
  * entry ^slicing.discriminator[0].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "In treatment with ophthalmologist"
  * entry ^definition = "Entry for statin in treatment with ophthalmologist."
