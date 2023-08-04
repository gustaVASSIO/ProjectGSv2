import { Router } from '@angular/router'
import Swal from 'sweetalert2'

export default class Message{
    constructor (
        private router: Router
    ){}
    public MessageSuccess(message : string, redirect: boolean, redirectTo : string = ''){
        Swal.fire({
            icon:'success',
            title:message,
            showConfirmButton:false,
            timer:2000
        }).then(() =>{
            if(redirect)
                this.router.navigate(['/' + redirectTo])     
        })
    }
    public MessageError(message : string, redirect: boolean, redirectTo : string = ''){
        Swal.fire({
            icon:'error',
            title:message,
            showConfirmButton:false,
            timer:2000
        }).then(() =>{
            if(redirect)
                this.router.navigate(['/' + redirectTo])     
        })
    }
}