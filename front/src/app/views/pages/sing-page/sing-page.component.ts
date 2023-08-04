import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { SingupModalComponent } from '../singup-modal/singup-modal.component';
import Swal from 'sweetalert2';
import { HttpResponse } from '@angular/common/http';
import { UserService } from 'src/app/controllers/user.service';
import User from 'src/app/models/user.model';

@Component({
  selector: 'app-sing-page',
  templateUrl: './sing-page.component.html',
  styleUrls: ['./sing-page.component.css']
})
export class SingPageComponent {
  passwordFieldControl : string =  'password'

  public formSignIn: FormGroup = new FormGroup({
    userName: new FormControl(undefined, [Validators.required]),
    password: new FormControl(undefined, [Validators.required])
  })

  constructor(
    private userService: UserService,
    private router: Router,
    private dialogRef: MatDialog

  ) { }

  public async confirmLogin() {
    const userRegister: User = { userId: undefined, ...this.formSignIn.value }


    this.userService.loginUser(userRegister).subscribe({
      next: (userToken) => {
        this.userService.userLoged = userToken
        this.userService.SaveUserOnLocalStorage(userToken)
        this.router.navigate(['/'])
      },
      error: (error) => {
        Swal.fire({
          icon: 'error',
          title: error.error,
          text: 'Verify your username and password'
        })
      }
    })
  }

  public openSignUpModal() {
    this.dialogRef.open(SingupModalComponent,
      {
        height: '600px',
        width: '400px',
      }
    )
  }

  
  public showPassord(){
    this.passwordFieldControl = 'text'
  }
  public hidePassord(){
    this.passwordFieldControl = 'password'
  }
}
