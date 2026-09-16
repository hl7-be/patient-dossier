### Usage, Boundaries and Relationships

**BeClinicalReport** is the *CareSet ClinicalReport*: the report on one patient's follow-up over a **defined period**, around one **medical context** (the report `code`, e.g. continuous glucose monitoring). It references the observations of that period and may add a textual interpretation and coded conclusions.

Not for a single measurement (an observation), an envelope grouping CareSets (a document), or the request behind it (`basedOn`).

| | Purpose | Granularity |
|---|---|---|
| **BeDocument** ([Bundle](StructureDefinition-be-document.html)) | Exchange **envelope**: a Composition organising CareSets into one shareable whole; no clinical data of its own. | One exchange |
| **BeClinicalReport** (this profile) | **Consolidation** of one context over one period, with the provider's interpretation and conclusions. | One patient, context, period |
| **BeClinicalObservation** (outside this guide) | One **observation** — a value with its method, performer and measuring device. | One value |

Read them as **envelope → report → value**. A report may be an entry of a BeDocument or stand alone; it references observations from `result` and never repeats their values.

#### Notes

- **`conclusion` vs `conclusionCode`** — free-text interpretation (0..1) and coded conclusions (0..*); either, both or neither. Supplied by `resultsInterpreter`, who need not be the `recorder`.
- **`presentedForm`** — the PDF renders *this* report; it does not replace the structured `result` references.
- **No device** — since V0.07 it belongs to the ClinicalObservation CareSet.
- `category` and `code` bind extensibly (SNOMED CT allowed); `status` keeps the required FHIR binding, default `final`.

Conceptual definition, with nl/fr translations: the [BeClinicalReport logical model](StructureDefinition-BeModelClinicalReport.html).
