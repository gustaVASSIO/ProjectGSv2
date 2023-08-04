import { Component } from '@angular/core';
import { ImproveService } from 'src/app/controllers/improve.service';
import Improve from 'src/app/models/improve.model';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-improves-peeding',
  templateUrl: './improves-peeding.component.html',
  styleUrls: ['./improves-peeding.component.css'],
  providers:[ImproveService]
})
export class ImprovesPeedingComponent {
  improvesPeeding : Improve[] = []
  public columns : string[] = ['reporter', 'summary', 'assignee', 'department', 'actions'];

  constructor(private improvementService : ImproveService){}
  
  ngOnInit(){
    this.loadImprovesPeeding()
  }

  private loadImprovesPeeding(){
    this.improvementService.getImprovesPeending().subscribe((data)=>{      
      this.improvesPeeding = data
    })
  }

  public approveImprove(id : string){
    this.improvementService.approveImprovement(id).subscribe({
      next: () => this.loadImprovesPeeding(),
      error: ({error}) => {
        Swal.fire({
          icon: 'error',
          title: "Invalid improve",
          text: error
        })
      }
      
    }) 
  }
}
