import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { forkJoin } from 'rxjs';
import { DepartmentService } from 'src/app/controllers/department.service';
import { IdeasourceService } from 'src/app/controllers/ideasource.service';
import { ImproveService } from 'src/app/controllers/improve.service';
import { InfoFinantialService } from 'src/app/controllers/infoFinantial.service';
import { MajorbenefitsService } from 'src/app/controllers/majorbenefits.service';
import { SourcetypeService } from 'src/app/controllers/sourcetype.service';
import { UserService } from 'src/app/controllers/user.service';
import Department from 'src/app/models/department.model';
import IdeaSource from 'src/app/models/ideasource.model';
import Improve from 'src/app/models/improve.model';
import MajorBenefits from 'src/app/models/majorbenefits.model';
import SourceType from 'src/app/models/sourcetype.model';
import { FTE } from 'src/app/shared/FTE';

@Component({
  selector: 'app-edit-improve',
  templateUrl: './edit-improve.component.html',
  styleUrls: ['./edit-improve.component.css']
})
export class EditImproveComponent {

  improveId?: string
  improve ?: Improve  
  departments?: Department[]
  majorbenefits?: MajorBenefits[]
  sourcetypes?: SourceType[]
  ideasources?: IdeaSource[]
  departmentDependencies?: Department

  formImprove: FormGroup = new FormGroup({
    summary: new FormControl(undefined, [Validators.required]),
    description: new FormControl(undefined, [Validators.required]),
    userId: new FormControl({ value: undefined, disabled: true }),
    assignee: new FormControl(undefined, [Validators.required]),
    dueDate: new FormControl(undefined, [Validators.required]),
    components: new FormControl(undefined, [Validators.required]),
    sourceTypeId: new FormControl(undefined, [Validators.required]),
    // ------------------------------------------------------------
    region: new FormControl({value: "LA",  disabled: true}),
    departmentId: new FormControl(undefined, [Validators.required]),
    currentOrganization: new FormControl({ value: undefined, disabled: true }),
    process: new FormControl({ value: undefined, disabled: true }),
    costCenter: new FormControl({ value: undefined, disabled: true }),
    affectEntities: new FormControl(undefined, [Validators.required]),
    // ------------------------------------------------------------
    ideaSourceId: new FormControl(undefined, [Validators.required]),
    cipPex: new FormControl(undefined, [Validators.required]),
    currency: new FormControl(undefined, [Validators.required]),
    priority: new FormControl(undefined, [Validators.required]),
    majorBenefitsId: new FormControl(undefined, [Validators.required]),
    estimatedHours: new FormControl({ value: undefined, disabled: true }),
    estimatedSaving: new FormControl({ value: undefined, disabled: true }),
    monetaryBenefit: new FormControl({ value: undefined, disabled: true }),
  })

  constructor(
    private departmentService: DepartmentService,
    private majorbenefitsService: MajorbenefitsService,
    private sourcetypesService: SourcetypeService,
    private idesourcesService: IdeasourceService,
    private improveService: ImproveService,
    private infoFinantialService: InfoFinantialService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit() {
    this.loadDependencies()
    this.loadForms()
  }

  public verifyEstimatedHours(): boolean {
    if (this.formImprove.get("majorBenefitsId")?.value == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      this.formImprove.controls['estimatedHours'].enable()
      return true
    }
    return false
  }

  public verifyEstimatedSaving(): boolean {
    if (this.formImprove.get("majorBenefitsId")?.value == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      return true
    }
    return false
  }

  public verifyMonetaryBenefit(): boolean {
    const majorBenefit = this.formImprove.get("majorBenefitsId")?.value
    if (majorBenefit == '11527ad8-5fed-4e6e-befe-f7e2be9137be') {
      this.formImprove.controls['monetaryBenefit'].disable()
      return true
    }
    if (
      majorBenefit == '151b5e71-65d0-4e68-a6e9-b4207c4113b2' ||
      majorBenefit == '18f6314c-095f-481c-aa76-25a28cb3b2d3' ||
      majorBenefit == '32604af2-1403-4610-8a18-f7c4c2ad295b'
    ) {
      this.formImprove.controls['monetaryBenefit'].enable()
      return true
    }
    this.clearBenefits()
    return false
  }

  public calcBenefits(hours: string) {
    if (hours != '') {
      const h = parseInt(hours)
      this.formImprove.get("estimatedSaving")?.patchValue(parseFloat((h / FTE).toFixed(2)))

      const cosCenterId = this.departmentDependencies?.costCenterId
      console.log(cosCenterId);
      
      const reductionHours = this.formImprove.get("estimatedHours")?.value
      console.log(cosCenterId);

      this.infoFinantialService.getMonetaryBenefit(cosCenterId!, parseInt(reductionHours!))
        .subscribe((costReduction) => {
          console.log(costReduction);

          this.formImprove.get("monetaryBenefit")?.patchValue(parseFloat(costReduction.toFixed(2)))
        })
    } else {
      this.clearBenefits()
    }
  }
  
  public loadDepartmentDependencies() {
    this.departmentService.getDepartment(this.formImprove.value.departmentId!).subscribe((data) => {

      this.departmentDependencies = data
      this.formImprove.get("currentOrganization")?.patchValue(data.currentOrganization.name)
      this.formImprove.get("process")?.patchValue(data.process.name)
      this.formImprove.get("costCenter")?.patchValue(data.costCenter?.code)

    })
  }

  public updateImprove() {
    const improve : Improve =  <Improve> {improvementId:this.improveId,  ...this.formImprove.getRawValue() }
    improve.userId = this.improve?.userId
    
    this.improveService.update(this.improveId!, improve).subscribe(() => {
      this.router.navigate(['/improves-peeding'])
    });
  }

  private loadForms() {
    this.route.params.subscribe((params) => {

      this.improveId = params["id"]
      this.improveService.getById(this.improveId!).subscribe((improveInfo) => {      
        
        this.improve = improveInfo

        this.formImprove.patchValue({
          summary: improveInfo.summary,
          description: improveInfo.description,
          userId: improveInfo.user?.userName.toUpperCase(),
          assignee: improveInfo.assignee,
          dueDate: improveInfo.dueDate,
          components: improveInfo.components,
          sourceTypeId: improveInfo.sourceTypeId,
          // ------------------------------------------------------------
          region: improveInfo.region,
          departmentId: improveInfo.departmentId,
          currentOrganization: improveInfo.department?.currentOrganization.name,
          process: improveInfo.department?.process.name,
          costCenter: improveInfo.department?.costCenter?.code,
          affectEntities: improveInfo.affectEntities,
          // ------------------------------------------------------------
          ideaSourceId: improveInfo.ideaSourceId,
          cipPex: improveInfo.cipPex,
          currency: improveInfo.currency,
          priority: improveInfo.priority,
          majorBenefitsId: improveInfo.majorBenefitsId,
          estimatedHours: improveInfo.estimatedHours,
          estimatedSaving: improveInfo.estimatedSaving,
          monetaryBenefit: improveInfo.monetaryBenefit,
        })
        this.loadDepartmentDependencies()
      })
    })


  }

  private loadDependencies() {

    forkJoin({
      department: this.departmentService.getDepartments(),
      majorbenefits: this.majorbenefitsService.getMajorBenefits(),
      sourcetypes: this.sourcetypesService.getSourceTypes(),
      ideasource: this.idesourcesService.getIdeaSources()
    }).subscribe(({ department, majorbenefits, sourcetypes, ideasource }) => {

      this.departments = department
      this.majorbenefits = majorbenefits
      this.sourcetypes = sourcetypes
      this.ideasources = ideasource
    })
  }

  public clearBenefits() {
    this.formImprove.get("estimatedHours")?.patchValue(undefined)
    this.formImprove.get("estimatedSaving")?.patchValue(undefined)
    this.formImprove.get("monetaryBenefit")?.patchValue(undefined)
  }
}
