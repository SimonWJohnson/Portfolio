import { DateTime } from 'luxon'
import { BaseModel, column } from '@ioc:Adonis/Lucid/Orm'

export default class Student extends BaseModel {

  @column({isPrimary: true})
  public id: string

  @column({columnName: 'GivenName'})
  public GivenName: string

  @column({columnName: 'LastName'})
  public LastName: string

  @column({columnName: 'EmailAddress'})
  public EmailAddress: string

  @column.dateTime({ autoCreate: true })
  public createdAt: DateTime

  @column.dateTime({ autoCreate: true, autoUpdate: true })
  public updatedAt: DateTime
}
