import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {Router } from '@angular/router';
import { Observable } from 'rxjs';
import UserToken from '../models/userToken.model';
import User from '../models/user.model';
import { API } from '../shared/API';


@Injectable()
export class UserService {

    public userLoged?: UserToken

    constructor(private http: HttpClient) { }

    public registerUser(user: User): Observable<UserToken> {
        return this.http.post<UserToken>(`${API}/Auth/Reporter`, user)
    }

    public registerAdmin(user: User): Observable<UserToken> {
        return this.http.post<UserToken>(`${API}/Auth/Admin`, user)
    }
    
    public loginUser(user: User): Observable<UserToken> {
        return this.http.post<UserToken>(`${API}/Auth/Login`, user)
    }

    public SaveUserOnLocalStorage(userToken: UserToken): void {
        localStorage.setItem("userToken", JSON.stringify(userToken))
    }

    public VerifyUserLoged(): boolean {
        const userStorage: UserToken = JSON.parse(localStorage.getItem("userToken")!)
        if (userStorage != null) {
            this.userLoged = userStorage
            return true
        } else {
            return false
        }
    }

    public Logout() : void{
        localStorage.removeItem("userToken")
        this.userLoged = undefined
    }
    public verifyAdminPermission(): boolean {
        return this.userLoged?.role == "Admin" ? true : false
    }

   public getHeadersWithToken() : HttpHeaders{
        let headers: HttpHeaders = new HttpHeaders()
        headers = headers.set("Authorization", "Bearer " + this.userLoged?.token!)
        return headers;
    
   }


}