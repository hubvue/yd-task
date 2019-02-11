
class SiteController {
    constructor(){};
    actionIndex(){
        return async(ctx)=>{
            ctx.body = await ctx.render('index');
        }
    }
}
module.exports = SiteController;