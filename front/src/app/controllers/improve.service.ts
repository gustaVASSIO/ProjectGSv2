import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, retry } from 'rxjs';
import Improve from '../models/improve.model';
import { API } from '../shared/API';

@Injectable({
  providedIn: 'root'
})
export class ImproveService {

  constructor(private readonly http : HttpClient) { }

  public getImprovesPeending() : Observable<Array<Improve>>{
    return this.http.get<Improve[]>(`${API}/Improvements/Peeding`)
  }

  public getById(id : string) : Observable<Improve>{
    return this.http.get<Improve>(`${API}/Improvements/${id}`)
  }
  public getReporterName() : Observable<string>{
    return this.http.get(``, {responseType : 'text'})
  }

  public getImprovesByUserId(id : string) : Observable<Improve[]>{
    return this.http.get<Improve[]>(`${API}/Improvements/Reporter/${id}`)
  } 

  public insert(improve : Improve) : Observable<Improve>{
    return this.http.post<Improve>(`${API}/Improvements`, improve)
  }
  public update(id: string, improve : Improve): Observable<void>{
    return this.http.put<void>(`${API}/Improvements/${id}`, improve)
  }
  public approveImprovement(id : string) : Observable<void>{
    return this.http.patch<void>(`${API}/Improvements/Approve/${id}`,{})
  }


}
