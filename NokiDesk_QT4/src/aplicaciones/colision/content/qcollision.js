var user = Qt.createComponent("content/Block.qml");
var maxColumn = 10;
var maxRow = 15;
var row = null
var column = null
var enemies = new Array();
var dx = new Array();
var dy = new Array();
var x_flag = new Array();
var y_flag = new Array();
var click_flag = 0;
var gravity_flag = 0;
var count = 3;
var num_bal = 3;
var xvel = 2;
var yvel = -5;
var acc = 0.5
var black = new Array()
var curState = null;
var start,end,tscore;
function startNewGame(type){
        if(curState != null)
            curState.destroy();
        score.text = "Score: Who Knows"
        num_bal = type;

        if(user != null){
            console.log("DESTROY")
            user.destroy()
            user = null
        }

        column = 620
        row = 1

        if(createBlock(column,row)){
            createEnemies();
        }
        else{
            console.log("Error Creating User ball");
        }
        var d = new Date();
        start = d.getTime();
        update_timer.start();
        click_flag = 1;
}
function createEnemies(){
    for(var i =0;i<num_bal;i++){
        var temp = Qt.createComponent("content/Enemy.qml");
        if(temp.status==Component.Ready){
            var dynamic = temp.createObject(gameCanvas);
            if(dynamic == null){
                console.log("error creating enemy");
                console.log(temp.errorString());
                return false;
            }
            dynamic.x = Math.random()*204;
            dynamic.y = Math.random()*400;
            dynamic.width = gameCanvas.blockSize;
            dynamic.height = gameCanvas.blockSize;
            temp = dynamic;
            enemies[i] = temp;
            dx[i] = Math.random()*10;
            dy[i] = Math.random()*10;
            while(dx[i]<5||dy[i]<5){
                dx[i] = Math.random()*10;
                dy[i] = Math.random()*10;
            }
            x_flag[i] = 1;
            y_flag[i] = 1;
        }
        else{
            console.log("error loading Enemy.qml");
            return false;
        }

    }
    count = num_bal;
    return true;
}
function createBlock(column,row){
        if(user == null){
              user = Qt.createComponent("content/Block.qml");
             // console.log('new creation')
        }

	if(user.status == Component.Ready){
                var dynamicObject = user.createObject(gameCanvas);
		if(dynamicObject == null){
                        console.log("error creating block");
                        console.log(user.errorString());
			return false;			
		}
		dynamicObject.x = row;
		dynamicObject.y = column;
		dynamicObject.width = gameCanvas.blockSize;
		dynamicObject.height = gameCanvas.blockSize;
                user = dynamicObject;
	}else{
                console.log("error loading block user");
                console.log(user.errorString());
		return false;
	}
	return true;
}
function update(){

    if(click_flag == 1){
        for(var i =0;i<num_bal;i++){
            if(enemies[i].x < 0){
                x_flag[i] = 1;
                dx[i] = Math.random()*10;
                while(dx[i]<5)
                    dx[i] = Math.random()*10;
            }
            if(enemies[i].x > gameCanvas.width-20){
                x_flag[i] = -1;
                dx[i] = Math.random()*10;
                while(dx[i]<5)
                    dx[i] = Math.random()*10;
            }
            if(enemies[i].y < 0){
                y_flag[i] =1;
                dy[i] = Math.random()*10;
                while(dy[i]<5)
                    dy[i] = Math.random()*10;
            }
            if(enemies[i].y > gameCanvas.height-30){
                y_flag[i] = -1;
                dy[i] = Math.random()*10;
                while(dy[i]<5)
                    dy[i] = Math.random()*10;
            }
            enemies[i].x += (dx[i]*x_flag[i]);
            enemies[i].y += (dy[i]*y_flag[i]);
            var dist = getDistance(user.x,user.y,enemies[i].x,enemies[i].y);
            if(dist <=40){
                user.drag_ena = 0;
                var d = new Date();
                end = d.getTime();
                tscore = (end-start)/1000 ;
              //  console.log(parseInt(tscore))
                var t = parseInt(tscore) + ""
                score.text = "Score: "+t;
                gravity_flag = 1;
                click_flag =0;

                break;
            }
           }
    }
    if(gravity_flag){

        if(count!=0){

            for(var i =0;i<num_bal;i++){
                enemies[i].x += xvel;
                enemies[i].y += yvel;
                if(enemies[i].x > gameCanvas.width + 20|| enemies[i].y > gameCanvas.height+20){
              //      console.log(enemies[i].x)
              //      console.log(enemies[i].y)
                    if(check_ele(i)){
                //        console.log(gameCanvas.width)
                //        console.log(gameCanvas.height)

                        black.push(i);
                        count -=1;
                    }
                }
            }
            yvel += acc;
            user.x += xvel;
            user.y +=yvel;
        }
        else{
           // console.log(count)
           // console.log("COUNT IS ZERO")
            var len = black.length;
            for(var i=0;i<len;i++)
                black.pop();
            GameOver();
        }
    }
}

function getDistance(x1,y1,x2,y2){
    var d1 = x1-x2;
    var d2 = y1-y2;
    return Math.sqrt(d1*d1 + d2*d2);
}



function check_ele(k){
    //console.log("Black: "+black.length);
    for(var i=0;i<black.length;i++){
        if(black[i] == k){
            return false}
    }
    return true
}
 function load(st) {
    var component = Qt.createComponent(st+".qml");

    if( component.status == Component.Ready ) {
        var dynamic = component.createObject(screen);
        if( dynamic == null ) {
            console.log("error creating state "+st);
            console.log(component.errorString());
            return false;
        }
        dynamic.x = screen.x
        dynamic.y = screen.y
        dynamic.width = screen.width;
        dynamic.height = screen.height;
        curState = dynamic;
    }
    else {
        console.log("error loading component state " + st);
        console.log(component.errorString());
        return false;
    }
}

 function GameOver(){
    xvel = 2;
    yvel =-5;
    acc =0.5;
    console.log("GAMEOVER")
    for(var i=0;i<3;i++){
        var temp = enemies.pop();

        dx.pop()
        dy.pop()
        x_flag.pop()
        y_flag.pop();
     }
   // user.destroy();
    gravity_flag = 0;
    click_flag=0;

 }
