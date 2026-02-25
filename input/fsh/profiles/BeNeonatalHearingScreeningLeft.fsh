Profile: BeNeonatalHearingScreeningLeft
Parent: BeObservation
Title: "Neonatal Hearing Screening - Left Ear"
Description: "Observation for neonatal hearing screening result for the left ear."

* code 1.. MS
* code = #neonatal-hearing-screening-left "Result of neonatal hearing screening (left ear)"
* subject 1..1 MS
* subject only Reference(BePatient)
* effective[x] only dateTime
* effectiveDateTime 1..1 MS
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from VSNeonatalHearingScreeningResults
