Instance: BeClinicalReportExample
InstanceOf: BeClinicalReport
Usage: #example
Title: "Clinical Report Example"
Description: "Technical example only. This instance is included for publication purposes and does not represent a real-world referral scenario."

* extension[recordedDate].valueDateTime = "2026-10-01"
* extension[recorder].valueReference.identifier.system = "http://example.org/practitioners"
* extension[recorder].valueReference.identifier.value = "PRAC-001"

* identifier.system = "http://example.org/clinical-reports"
* identifier.value = "REPORT-001"

* status = #final
* code.text = "Clinical follow-up report"

* subject.identifier.system = "http://example.org/patients"
* subject.identifier.value = "PAT-001"

* effectivePeriod.start = "2026-10-01"
* effectivePeriod.end = "2026-10-14"
