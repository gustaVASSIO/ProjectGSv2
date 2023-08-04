import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import SourceType from '../models/sourcetype.model';
import { API } from '../shared/API';

@Injectable({
  providedIn: 'root'
})
export class SourcetypeService {

  constructor(private readonly http : HttpClient) { }
  public getSourceTypes() : Observable<Array<SourceType>>{
    return this.http.get<Array<SourceType>>(`${API}/SourceTypes`)
  }
}
