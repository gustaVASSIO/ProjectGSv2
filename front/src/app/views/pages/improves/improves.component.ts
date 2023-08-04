import { Component } from '@angular/core';
import { ImproveService } from 'src/app/controllers/improve.service';
import { UserService } from 'src/app/controllers/user.service';
import Improve from 'src/app/models/improve.model';

@Component({
  selector: 'app-improves',
  templateUrl: './improves.component.html',
  styleUrls: ['./improves.component.css'],
  providers:[ImproveService]
})
export class ImprovesComponent {

  
  improves : Improve[] = []
  displayedColumns: string[] = ['summary', 'assignee', 'department', 'majorbenefit', 'status'];
  
  constructor(
    private improveService : ImproveService,
    private userService : UserService
    ){}

  ngOnInit(){
    this.loadImproves()
  }

  private loadImproves(){
    this.improveService.getImprovesByUserId(this.userService.userLoged?.userId!).subscribe((data)=>this.improves = data)
  }
}
