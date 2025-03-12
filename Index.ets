//index.ets

import { router } from  '@kit.ArkUI';  //导入 @kit.ArkUI 模块中的 router 对象，用于页面路由和导航
import { BusinessError } from '@kit.BasicServicesKit'; //导入 @kit.BasicServicesKit 模块中的 BusinessError 类，用于处理业务错误

@Entry //表示这个组件是应用的入口页面
@Component //表示这个结构体是一个自定义组件
struct Index { //定义一个名为 Index 的结构体，表示页面的主组件
  @State message: string = 'Hello World';   //使用 @State 定义一个名为 message 的变量，初始值为 'Hello World'。
  // @State 表示这个变量是响应式的，当它的值发生变化时，UI 会自动更新

  build() { //方法是组件的构建函数，用于定义组件的 UI 结构
    Row(){  //创建一个行布局容器，子组件将水平排列，
      Column(){ //在行布局中创建一个列布局容器，子组件将垂直排列
        Text(this.message)  //创建一个文本组件，显示 message 变量的值
          .fontSize(50) //设置文本的字体大小为 50
          .fontWeight(FontWeight.Bold)  //设置文本的字体粗细为粗体
        //添加按钮.以响应用户点击
        Button(){   //创建一个按钮组件
          Text('Next')  //在按钮内部创建一个文本组件，显示 'Next'
            .fontSize(30) //设置按钮内部文本的字体大小为 30
            .fontWeight(FontWeight.Bold) //设置按钮内部文本的字体粗细为粗体
        }
        .type(ButtonType.Capsule)  //设置按钮的类型为胶囊形状
        .margin({
          top:20  //设置按钮的上边距为 20
        })
        .backgroundColor('#809FFB') //设置按钮的背景颜色为 #809FFB
        .width('40%') //设置按钮的宽度为父容器的 40%
        .height('5%') //设置按钮的高度为父容器的 5%
        //跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {  //为按钮绑定点击事件
          console.info(`Succeeded in clicking the ‘Next’ buttom.`) //在控制台打印日志，表示按钮点击成功
          //跳转到第二页
          router.pushUrl( {url:'pages/Second'}).then(() => { //使用 router.pushUrl 方法跳转到 pages/Second 页面
            console.info('Succeeded in jumping to the second page.') //在控制台打印日志，表示页面跳转成功


          }).catch((err: BusinessError) => { //捕获页面跳转失败的错误
            console.error('Failed to jump to the second page. Code is ${err.code},message is ${err:message}')
          })  //在控制台打印错误日志，包括错误代码和错误信息
        })
      }
      .width('100%') //设置列布局的宽度为父容器的 100%
    }
    .height('100%') //设置行布局的高度为父容器的 100%
  }
}