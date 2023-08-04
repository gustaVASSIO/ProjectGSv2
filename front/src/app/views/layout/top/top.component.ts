import { Router } from '@angular/router';
import { Component } from '@angular/core';
import { UserService } from 'src/app/controllers/user.service';

@Component({
  selector: 'app-top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.css']
})
export class TopComponent {
  constructor(
    public userService : UserService,
    private router : Router
    ){}
  
  public logout(){
    this.userService.Logout()
    this.router.navigate(['/sign'])
  }
}
