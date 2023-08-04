import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { API } from '../shared/API';
import Department from '../models/department.model';

@Injectable({
  providedIn: 'root'
})
export class DepartmentService {

  constructor(private readonly http : HttpClient) { }
  
  public getDepartments() : Observable<Array<Department>>{
    return this.http.get<Array<Department>>(`${API}/Departments`)
  }

  public getDepartment(id : string) : Observable<Department>{
    return this.http.get<Department>(`${API}/Departments/${id}`)
  }

}
