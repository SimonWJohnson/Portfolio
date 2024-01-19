import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Schema from '@ioc:Adonis/Lucid/Schema'
import Student from 'App/Models/Student'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
import StudentValidator from 'App/Validators/StudentValidator'

export default class StudentsController {
  public async index({}: HttpContextContract) {
    //return{hello: 'world'}
    const students = await Student.all()

    return students
  }

  public async create({}: HttpContextContract) {}

  // POST
  public async store({request, response}: HttpContextContract) {
    
    //const id = request.input('id')
    const invalidstudent = await Student.find(request.input("id"))
    const payload = await request.validate(StudentValidator)

    if(invalidstudent){
      return response.badRequest({message: "Student already exists"})
    }
    const student: Student = await Student.create(payload)

    return response.ok(student)
  }

  // GET
  public async show({params, response}: HttpContextContract) {
    const student = await Student.find(params.id)
    if(!student){
      return response.badRequest({message: "Student not found" })
    }
    else{
      return response.ok(student)
    }
  }

  public async edit({}: HttpContextContract) {}

  // PUT & PATCH
  public async update({params, request, response}: HttpContextContract) {
    
    const id = params.id
    const student = await Student.find(id)

    if(!student){
      return response.badRequest({message: "Student not found" })
    }

    if(request.method() === 'PUT'){
      const payload = await request.validate(StudentValidator)
      
      student.merge(payload)
    }

    if(request.method() === 'PATCH'){
      student.id = params.id
      student.GivenName = request.input('GivenName')
      student.LastName = request.input('LastName')
      student.EmailAddress = request.input('EmailAddress')

      await student.save()
    }
   
    await student.save()
    return response.ok(student)
  }

  // DELETE
  public async destroy({params, response}: HttpContextContract) {
    const id = params.id
    const student = await Student.find(id)

    if(!student){
      return response.notFound({message: "Student not found" })
    }
    else{
      await student.delete()

      return response.ok({
        message: 'Student ' + id + ': ' + student.GivenName + student.LastName + ' was successfully deleted.',
      })
    }
  }
}
