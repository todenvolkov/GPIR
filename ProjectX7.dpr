program ProjectX7;

uses
  Forms,
  Budgets in 'Budgets.pas' {BudgetsForm},
  Main in 'Main.pas' {MainForm},
  routines in 'routines.pas',
  Splash in 'Splash.pas' {SplashForm},
  sprUnitAccountingHours in 'sprUnitAccountingHours.pas' {SprFormAccountingHours},
  sprUnitAccountingHourValues in 'sprUnitAccountingHourValues.pas' {SprFormAccountingHourValues},
  sprUnitBudgetArticles in 'sprUnitBudgetArticles.pas' {sprBudgetArticles},
  spUnitCities in 'spUnitCities.pas' {sprCities},
  spUnitConformityArticles in 'spUnitConformityArticles.pas' {sprConformityArticles},
  SQLRoutines1 in 'SQLRoutines1.pas',
  TaskBar in 'TaskBar.pas' {TaskBarForm},
  sprUnitPlaceResidense in 'sprUnitPlaceResidense.pas' {PlaceResidenseForm},
  sprUnitCostResiding in 'sprUnitCostResiding.pas' {sprCostResidingForm},
  sprUnitCostTrip in 'sprUnitCostTrip.pas' {sprCostTripForm},
  sprUnitTypesTransport in 'sprUnitTypesTransport.pas' {TypesTransportForm},
  sprUnitSectors in 'sprUnitSectors.pas' {SectorsForm},
  sprUnitConformityPosts in 'sprUnitConformityPosts.pas' {ConformityPostsForm},
  spUnitDailyAllowances in 'spUnitDailyAllowances.pas' {DailyAllowancesForm},
  spUnitDepartments in 'spUnitDepartments.pas' {DepartmentsForm},
  sprUnitDirections in 'sprUnitDirections.pas' {DirectionsForm},
  sprUnitDivisions in 'sprUnitDivisions.pas' {SprDivisionsForm},
  sprUnitEmployees in 'sprUnitEmployees.pas' {EmployeesForm},
  sprUnitFieldContentment in 'sprUnitFieldContentment.pas' {FieldContentmentForm},
  sprUnitGroups in 'sprUnitGroups.pas' {GroupsForm},
  sprUnitContracts in 'sprUnitContracts.pas' {ContractsForm},
  sprUnitPosts in 'sprUnitPosts.pas' {PostsForm},
  sprUnitMeasures in 'sprUnitMeasures.pas' {UnitMeasuresForm},
  sprUnitTypesWork in 'sprUnitTypesWork.pas' {TypesWorkForm},
  sprUnitOrganizations in 'sprUnitOrganizations.pas' {sprOrganizationsForm},
  Users in 'Users.pas' {UsersForm},
  Tasks in 'Tasks.pas' {TasksForm},
  PlannedWorkSelect in 'PlannedWorkSelect.pas' {PlannedWorkSelectForm},
  PlannedWorkOISISelect in 'PlannedWorkOISISelect.pas' {PlannedWorkOISISelectForm},
  NumbersContracts in 'NumbersContracts.pas' {NumbersContractsForm},
  ArticleToBudget in 'ArticleToBudget.pas' {ArticleToBudgetForm},
  PlannedRentSelect in 'PlannedRentSelect.pas' {PlannedRentSelectForm},
  PlannedRent in 'PlannedRent.pas' {PlannedRentForm},
  PlannedTransportSelect in 'PlannedTransportSelect.pas' {PlannedTransportSelectForm},
  PlannedTransport in 'PlannedTransport.pas' {PlannedTransportForm},
  PlannedManualValueSelect in 'PlannedManualValueSelect.pas' {PlannedManualValueSelectForm},
  PlannedManualValue in 'PlannedManualValue.pas' {PlannedManualValueForm},
  PlannedTripsSelect in 'PlannedTripsSelect.pas' {PlannedTripsSelectForm},
  PlannedTrips in 'PlannedTrips.pas' {PlannedTripsForm},
  PlannedTripsShiftSelect in 'PlannedTripsShiftSelect.pas' {PlannedTripsShiftFormSelect},
  PlannedTripsShift in 'PlannedTripsShift.pas' {PlannedTripsShiftForm},
  PlannedFieldContentment in 'PlannedFieldContentment.pas' {PlannedFieldContentmentForm},
  PlannedWork in 'PlannedWork.pas' {PlannedWorkForm},
  PlannedWorkOISI in 'PlannedWorkOISI.pas' {PlannedWorkOISIForm},
  GridViewTemplateSource in 'GridViewTemplateSource.pas' {GridVewTemplateFormSource},
  TreeUnit in 'TreeUnit.pas' {TreeForm},
  Common in 'Common.pas',
  XLSImportUnit in 'XLSImportUnit.pas' {XLSImportForm},
  BudgetOrgFlow in 'BudgetOrgFlow.pas' {BudgetOrgFlowForm},
  XLS1CImport in 'XLS1CImport.pas' {XLS1CImportForm},
  Files in 'Files.pas' {FilesForm},
  ArticleToBudgetExt in 'ArticleToBudgetExt.pas' {ArticleToBudgetExtForm},
  Options in 'Options.pas' {OptionsForm},
  Sessions in 'Sessions.pas' {SessionsForm},
  History in 'History.pas' {HistoryForm},
  Stages in 'Stages.pas' {StagesForm},
  StageXLSImport in 'StageXLSImport.pas' {StageXLSImportForm},
  PlannedSubcontract in 'PlannedSubcontract.pas' {PlannedSubcontractForm},
  Reports in 'Reports.pas' {ReportsForm},
  NewTask in 'NewTask.pas' {NewTaskForm},
  Hint in 'Hint.pas' {HintForm},
  WorkWithExcel in 'WorkWithExcel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.Title := 'ProjectX7';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSplashForm, SplashForm);
  Application.CreateForm(TTaskBarForm, TaskBarForm);
  Application.CreateForm(TXLSImportForm, XLSImportForm);
  Application.CreateForm(TBudgetOrgFlowForm, BudgetOrgFlowForm);
  Application.CreateForm(THistoryForm, HistoryForm);
  Application.CreateForm(TReportsForm, ReportsForm);
  Application.CreateForm(TNewTaskForm, NewTaskForm);
  Application.CreateForm(THintForm, HintForm);
  //Application.CreateForm(TStagesForm, StagesForm);
  Application.CreateForm(TStageXLSImportForm, StageXLSImportForm);
  //Application.CreateForm(TPlannedSubcontractForm, PlannedSubcontractForm);
  //Application.CreateForm(TSessionsForm, SessionsForm);
  //Application.CreateForm(TOptionsForm, OptionsForm);
  //Application.CreateForm(TArticleToBudgetExtForm, ArticleToBudgetExtForm);
  Application.CreateForm(TXLS1CImportForm, XLS1CImportForm);
  Application.CreateForm(TFilesForm, FilesForm);
  //Application.CreateForm(TForm3, Form3);

  //Application.CreateForm(TsprStages, sprStages);
  MayClose := False;
  SplashForm.Show;
  SplashForm.SetFocus;
 // TreeForm.Visible:=true;
  Application.Run;

end.
