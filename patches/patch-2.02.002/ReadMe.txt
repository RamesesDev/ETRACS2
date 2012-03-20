Patch-2.02.002 (CUMMULATIVE)
----------------------------------------------------

- Add City/Municipality Info in RPT No Ledger Collection useful for province collection
- Add duplicate tdno and pin subdivision validation 
- Display in home page : Subdivision Mgmt and Consolidation Mgmt
- Change RETIRELOB to RETIRE selection on the business application renewal
- Add search by tradename and txnno support for bp application listing
- Fix account code mapping for eNGAS export
- Round-off bp billing computed values
- Exclude retired/retiredlob from permit printout 
- Add RPT Tax Clearance report
- Add Change Classification and Change Taxability transactions 
- Carryover annotations during transaction 
- Allow selection of Liquidating Officer in the Remittance initial page 
  to avoid the hassle of changing liquidating officers in cases of leave, absence etc
- Provide Multi-Cashier Support on liquidation 
- General Revision Transaction and Batch GR Transaction 
- Fix fullpin info in Assessment Roll, TMCR, etc.
- Add Status info in Journal of Assessment Transaction 
- Fix ending values ( Accomplishment Report of RPA)
- Add faaslist.restriction field 
- Add Monthly/Quarterly Report on Real Property Assessment 
- Add Provincial Form60 Reort
- Support for non-integer Productive/Non-Productive plant/tree RPU such as per area
- Implement delete rpt ledger item
- Add option to calculate bldg age based on dtoccupied only (surigao)
- Blank material info when material code is "-". This is a temporary fix 
  since the bugs in framework related.
- Liquidation: allow selection of cashier instead of automatically assigned
- Add "Close" on deposit screen
- Fix RPTLedger item update and remove bugs
- Add class code in RPT Billing Report 
- Fix BldgType entry focus bug 
- Add Transfer with Reassessment support 
- Add Provincial Form 60 report
- Fix actual use adjustment null pointer error
- Fix property payer entry
- Remove JAT Report from transaction menu
--------------
- Allow editing of LandRPU assessed value to match manual assessed value  
  that resulted in rounding-off problems
- Correct grid cell-locking problem in Bldg Structures
- Add indexno to structures to facilitate easier entry in bldg structures
- Fix bill parameter to updateDetailPeriod 
- Properly handle billing for currentyear with partial payment
- Correct rpt partial payment voiding error 
--------------
- Deprecate RPTOfficers. Lookup rpt officers from etracs users using roles


