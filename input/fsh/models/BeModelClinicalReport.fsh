// =============================================================================
// Logical model: CareSet ClinicalReport (generic) - V00.06
// Derived from "Careset Clinical Report V00.06 FR" business & functional specs.
// English name/short/definition inline; Dutch (nl) and French (fr) translations
// added via `insert Xlate(...)` - one call per language (see rulesets.fsh).
// Every element is Must Support (SU), per the Belgian conventions.
// =============================================================================

Logical: BeModelClinicalReport
Id: BeModelClinicalReport
Title: "BE Model ClinicalReport"
Description: "Logical model of the CareSet ClinicalReport: a clinical report that collects the essential information for the follow-up of a patient over a defined period, consolidates the referenced clinical observations, reports and documents around a well-defined medical context, and may carry a clinical interpretation. It is intended to be shared between health professionals."
* ^status = #draft
* ^experimental = true

* businessIdentifier 1..* SU Identifier "Business identifier of the report" "Business identifier of the report."
* insert Xlate(businessIdentifier, nl, "Zakelijke identificatie van het verslag.")
* insert Xlate(businessIdentifier, fr, "Identifiant métier du rapport.")

* basedOn 0..1 SU Reference "Reference to the request underlying the report" "Reference to the request that is the basis of the report. E.g. a referral prescription (telemonitoring)."
* insert Xlate(basedOn, nl, "Verwijzing naar de aanvraag die aan de basis van het verslag ligt. Bv.: verwijsvoorschrift (telemonitoring\).")
* insert Xlate(basedOn, fr, "La référence de la demande à la base du rapport. Ex. : prescription de renvoi (télémonitoring\).")

* recordedDate 1..1 SU dateTime "Date the report was recorded / last updated" "Date of the last (functional) update of the report."
* insert Xlate(recordedDate, nl, "Datum van de laatste (functionele\) bijwerking van het verslag.")
* insert Xlate(recordedDate, fr, "Date de la dernière mise à jour (fonctionnelle\) du rapport.")

* observationPeriod 1..1 SU Period "Period the report covers" "From-date to-date corresponding to the period the report covers."
* insert Xlate(observationPeriod, nl, "Van-datum tot-datum die overeenkomt met de periode waarop het verslag betrekking heeft.")
* insert Xlate(observationPeriod, fr, "De date à date correspondant à la période sur laquelle le rapport porte.")

* patient 1..1 SU Reference(Patient) "The patient the report is about" "The person who is the subject of the healthcare the record (CareSet) refers to. See BR PP 'Identification of a physical person'."
* insert Xlate(patient, nl, "De persoon die het onderwerp is van de gezondheidszorg waarnaar de registratie (CareSet\) verwijst. Zie BR PP 'Identificatie natuurlijke persoon'.")
* insert Xlate(patient, fr, "La personne qui est l'objet des soins de santé auxquels l'enregistrement (CareSet\) fait référence. Voir BR PP « Identification personne physique ».")

* recorder 1..1 SU Reference "Who recorded the report" "The health professional or organisation that records the information and takes responsibility for its content. See BR PP 'Identification of a physical person'."
* insert Xlate(recorder, nl, "De gezondheidszorgbeoefenaar of organisatie die de informatie registreert en de verantwoordelijkheid voor de inhoud ervan op zich neemt. Zie BR PP 'Identificatie natuurlijke persoon'.")
* insert Xlate(recorder, fr, "Le professionnel de la santé ou l'organisation qui encode les informations et prend la responsabilité de leur contenu. Voir BR PP « Identification personne physique ».")

* interpreter 0..1 SU Reference "Who interprets the observations of the report" "The care provider who interprets the observations of the report. E.g. endocrinologist, general practitioner. See BR PP 'Identification of a physical person'."
* insert Xlate(interpreter, nl, "De zorgverlener die de observaties van het verslag interpreteert. Bv.: endocrinoloog\, huisarts. Zie BR PP 'Identificatie natuurlijke persoon'.")
* insert Xlate(interpreter, fr, "Le prestataire de soins qui interprète les observations du rapport. Ex. : NISS endocrinologue\, NISS généraliste. Voir BR PP « Identification personne physique ».")

* category 1..* SU CodeableConcept "Clinical/functional classification of the report" "A category is a classification attribute of a data element in a CareSet, defined by a standardised ValueSet, allowing information to be grouped according to its clinical or functional meaning. E.g. Glucose monitoring, Cardiology. See VS_Rep_Category."
* category from BeVSClinicalReportCategory (extensible)
* insert Xlate(category, nl, "Een categorie is een classificatiekenmerk van een gegevenselement in een CareSet\, gedefinieerd door een gestandaardiseerde ValueSet\, waarmee informatie kan worden gegroepeerd volgens de klinische of functionele betekenis ervan. Bv. Glucosemonitoring\, Cardiologie. Zie VS_Rep_Category.")
* insert Xlate(category, fr, "Une catégorie est un attribut de classification d'un élément de données dans un CareSet\, défini par une ValueSet standardisée\, permettant de regrouper les informations selon leur signification clinique ou fonctionnelle. Ex. Suivi Glycémie\, Cardio. Voir VS_Rep_Category.")

* code 1..1 SU CodeableConcept "Code of the report" "Code of the report. It indicates the type of procedure that leads to the production of the primary values (measurement clinical observations) of this report. See VS_Rep_Code."
* code from BeVSClinicalReportCode (extensible)
* insert Xlate(code, nl, "Code van het verslag. Het geeft het type procedure aan dat leidt tot de productie van de primaire waarden (measurement clinical observations\) van dit verslag. Zie VS_Rep_Code.")
* insert Xlate(code, fr, "Code du rapport. On propose d'indiquer le type de procédure qui conduit à la production des valeurs primaires (measurement clinical observations\) de ce rapport. Voir VS_Rep_Code.")

* device 0..1 SU CodeableConcept "Medical device used to create the observations" "Reference to the medical device used to create the observations of the report, provided that all observations included in the report use the same device. See BR DRO 'Device for ClinicalReport and Observation'. See VS_Obs_Device."
* device from BeVSClinicalReportDevice (extensible)
* insert Xlate(device, nl, "Verwijzing naar het medische hulpmiddel dat gebruikt is om de observaties van het verslag te maken\, op voorwaarde dat alle in het verslag opgenomen observaties hetzelfde hulpmiddel gebruiken. Zie BR DRO 'Device voor ClinicalReport en Observation'. Zie VS_Obs_Device.")
* insert Xlate(device, fr, "Référence au dispositif médical utilisé pour créer les observations du rapport\, à condition que toutes les observations incluses dans le rapport utilisent le même dispositif. Voir BR DRO « Device pour ClinicalReport et Observation ». Voir VS_Obs_Device.")

* clinicalObservations 0..* SU Reference(Observation) "Referenced clinical observations" "List of references to the different ClinicalObservations that are part of the report."
* insert Xlate(clinicalObservations, nl, "Lijst met verwijzingen naar de verschillende ClinicalObservations die deel uitmaken van het verslag.")
* insert Xlate(clinicalObservations, fr, "Liste des références des différents ClinicalObservations qui font parties du rapport.")

* diagnosis 0..* SU CodeableConcept "Diagnosis / problem concluded from the report" "Reference to the problem related to this clinical report. This element is provided by the care provider who performs the interpretation."
* insert Xlate(diagnosis, nl, "Verwijzing naar het probleem dat verband houdt met dit klinische verslag. Dit element wordt geleverd door de zorgverlener die de interpretatie uitvoert.")
* insert Xlate(diagnosis, fr, "Référence du problème en rapport avec ce rapport clinique. Cet élément sera fourni par le prestataire de soins qui fait l'interprétation.")

* note 0..* SU Annotation "Free-text additional information" "Additional information about the content of the CareSet, in free text format."
* insert Xlate(note, nl, "Aanvullende informatie over de inhoud van de CareSet in vrijetekstformaat.")
* insert Xlate(note, fr, "Informations complémentaires relatives au contenu du CareSet en format texte libre.")

* document 0..1 SU Attachment "PDF document of the complete report" "PDF document containing the complete report (text, graphics, derived observations, conclusions, ...)."
* insert Xlate(document, nl, "PDF-document met het volledige verslag (tekst\, grafieken\, afgeleide observaties\, conclusies\, ...\).")
* insert Xlate(document, fr, "Document PDF reprenant le rapport complet (texte\, graphiques\, observations déduites\, conclusions ...\).")

* status 1..1 SU code "Status of the report" "Status of the report. The default is 'final' (Final report). See VS_Status."
* status from http://hl7.org/fhir/ValueSet/diagnostic-report-status (required)
* insert Xlate(status, nl, "Status van het verslag. De standaardwaarde is 'final' (Eindverslag\). Zie VS_Status.")
* insert Xlate(status, fr, "Statut du rapport. Le défaut est « final » (Rapport final\). Voir VS_Status.")
