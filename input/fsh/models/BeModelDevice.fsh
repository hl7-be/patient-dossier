Logical: BeModelDevice
Title: "Device Logical Model"
Description: "Logical model for a medical device"

* owner 0..1 Reference(Organization) "Owner" "Organization responsible for the device"
* patient 0..1 Reference(Patient) "Patient" "Patient in whom the device is implanted or for whom it is used"
* udiCarrier 0..1 BackboneElement "UDI Carrier" "The Unique Device Identifier (UDI), usually captured by scanning a barcode or RFID label, enabling unique identification of the exact device (manufacturer, type, lot number, serial number, expiration date, etc.)"
  * deviceIdentifier 0..1 string "Device Identifier" "The device identifier (DI) portion of the UDI"
  * carrierHRF 0..1 string "Carrier HRF" "Human-readable form of the UDI"
* identifier 0..1 Identifier "Identifier" "Alternative identifier when no UDI is available, e.g. a NIHDI notification number or other alternative identifier"
* status 0..1 code "Status" "Status of the device (active, inactive, entered-in-error, unknown)"
* status from DeviceStatusVS
* statusReason 0..* CodeableConcept "Status Reason" "Reason why the device has a particular status, e.g. why it is inactive or out of service"
* statusReason from DeviceStatusReasonVS
* type 0..1 CodeableConcept "Type" "The kind of medical device, e.g. SNOMED CT code 304120007 - Cardiac pacemaker, device (physical object)"
* type from DeviceTypeVS
* deviceDefinition 0..1 Reference "Device Definition" "Reference to the generic definition of the device, describing general characteristics of the device type rather than the unique instance"
* manufacturer 0..1 string "Manufacturer" "The manufacturer that produced the device, e.g. Medtronic"
* manufactureDate 0..1 dateTime "Manufacture Date" "The date the device was manufactured"
* expirationDate 0..1 dateTime "Expiration Date" "The date after which the device may no longer be used"
* lotNumber 0..1 string "Lot Number" "The lot or batch number in which the device was produced"
* version 0..1 string "Version" "The actual version of the device or the software version running on it"
* serialNumber 0..1 string "Serial Number" "A unique identification code assigned by the manufacturer to one specific device"
* deviceName 0..1 string "Device Name" "The name of the medical device as determined by the manufacturer"
* modelNumber 0..1 string "Model Number" "The model number of the device as assigned by the manufacturer"
* property 0..* BackboneElement "Property" "The actual configuration settings of a device as it operates, e.g. regulation status or time properties"
  * type 1..1 CodeableConcept "Property Type" "Code that specifies the property"
  * value[x] 0..1 Quantity or CodeableConcept or string or boolean or integer or Range or Attachment "Property Value" "Value of the property"
* note 0..* Annotation "Note" "General notes about the device"


ValueSet: DeviceStatusVS
Title: "Device Status Value Set"
Description: "Device Status - placeholder valueset - the normative definition will be published in the Belgian terminology IG."
* ^url = "https://www.ehealth.fgov.be/standards/fhir/terminology/ValueSet/be-vs-device-status"
* ^status = #active
* ^experimental = false
* http://hl7.org/fhir/device-status#active "Active"
* http://hl7.org/fhir/device-status#inactive "Inactive"
* http://hl7.org/fhir/device-status#entered-in-error "Entered in Error"
* http://hl7.org/fhir/device-status#unknown "Unknown"


ValueSet: DeviceStatusReasonVS
Title: "Device Status Reason Value Set"
Description: "Device Status Reason - placeholder valueset - the normative definition will be published in the Belgian terminology IG."
* ^url = "https://www.ehealth.fgov.be/standards/fhir/terminology/ValueSet/be-vs-device-status-reason"
* ^status = #active
* ^experimental = false
* include codes from system http://terminology.hl7.org/CodeSystem/device-status-reason


ValueSet: DeviceTypeVS
Title: "Device Type Value Set"
Description: "Device Type - placeholder valueset - the normative definition will be published in the Belgian terminology IG."
* ^url = "https://www.ehealth.fgov.be/standards/fhir/terminology/ValueSet/be-vs-device-type"
* ^status = #active
* ^experimental = false
* include codes from system $sct where concept is-a #49062001 "Device"
