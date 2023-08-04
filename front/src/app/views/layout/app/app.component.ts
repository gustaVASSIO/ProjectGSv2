import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from 'src/app/controllers/user.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  constructor(
    public userService : UserService,
    private router: Router
  ){}
  ngOnInit(){
    if(!this.userService.VerifyUserLoged())
        this.router.navigate(['/sign'])  
     
  }
}
 