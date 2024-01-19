import { HttpContext } from '@adonisjs/core/build/standalone'
import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import User from 'App/Models/User'

export default class AuthController {
    public async login({request, auth}: HttpContextContract){
        const email = request.input('email')
        const password = request.input('password')
        const token = await auth.use('api').attempt(email, password, {
            expiresIn: '30 days',
        })
        return token.toJSON()
    }

    public async register({request, auth}: HttpContextContract){
        const email = request.input('email')
        const password = request.input('password')
        const newUser = new User()
        newUser.email = email
        newUser.password = password
        await newUser.save()
        const token = await auth.use('api').login(newUser, {
            expiresIn: '30 days',
        })
        return token.toJSON()
    }

}
