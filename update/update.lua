--白衣远程更新/2766521276
function 更新弹窗(version, size, changelog)
  -- 更新弹窗调用
  layout = {
    LinearLayout,
    layout_height = "fill",
    layout_width = "fill",
    orientation = "vertical",
    gravity = "center",
    {
      ImageView,
      src = "gengxin.png",
      scaleType = "fitCenter",
      layout_height = "136dp", -- 原图尺寸/1.5
      layout_width = "300dp",
      layout_marginTop = "50dp" -- 在有关闭按钮的情况下让弹窗保持在中间
    },
    {
      ScrollView, -- 使用滚动布局可以防止更新日志过长导致显示不全
      background = "#FFFFFFFF", -- 弹窗背景色
      layout_width = "300dp",
      VerticalScrollBarEnabled = false, -- 禁用滚动条
      {
        LinearLayout,
        layout_height = "fill",
        layout_width = "260dp",
        orientation = "vertical",
        layout_gravity = "top|center",
        {
          TextView,
          layout_gravity = "center",
          text = "发现新版本",
          textSize = "18dp",
          textColor = "#FF000000",
          layout_marginTop = "10dp"
        },
        {
          LinearLayout,
          layout_width = "fill",
          layout_height = "fill",
          orientation = "horizontal",
          {
            LinearLayout,
            orientation = "horizontal",
            gravity = "center|left",
            layout_width = "130dp",
            layout_height = "5%h",
            {
              TextView,
              textSize = "13sp",
              layout_marginLeft = "10dp",
              textColor = "#FF656565",
              text = "版本："
            },
            {
              TextView,
              text = version,
              --text = 当前版本.."→"..version, -- 如果显示当前版本
              textSize = "13sp",
              textColor = "#FF656565",
            }
          },
          {
            LinearLayout,
            orientation = "horizontal",
            gravity = "center|right",
            layout_width = "130dp",
            layout_height = "5%h",
            {
              TextView,
              textSize = "13sp",
              textColor = "#FF656565",
              text = "大小：".. size
            }
          }
        },
        {
          TextView,
          text = changelog,
          textSize = "15dp",
          textColor = "#FF656565",
          layout_marginTop = "15dp"
        }
      }
    },
    {
      LinearLayout,
      layout_width = "fill",
      gravity = "center",
      orientation = "horizontal",
      layout_height = "fill",
      {
        LinearLayout,
        layout_width = "110dp",
        id = "linecd",
        gravity = "center",
        background = "#FFFFFFFF",
        {
          CardView,
          layout_marginBottom = "10dp",
          id = "shaohou",
          elevation = 0,
          layout_marginTop = "12dp",
          layout_gravity = "center",
          radius = "5dp",
          cardBackgroundColor = "#FFEC463A",
          {
            TextView,
            layout_width = "90dp",
            textColor = "#FFFFFFFF",
            text = "稍后再说",
            layout_height = "40dp",
            id = "sh",
            layout_gravity = "center",
            gravity = "center",
            textSize = "15dp"
          }
        }
      },
      {
        LinearLayout,
        layout_width = "80dp",
        gravity = "center",
        background = "#FFFFFFFF",
        {
          CardView,
          layout_marginBottom = "10dp",
          elevation = 0,
          layout_marginTop = "12dp",
          layout_gravity = "center",
          radius = "5dp",
          cardBackgroundColor = "#FFFFFFFF",
          {
            TextView,
            layout_width = "70dp",
            textColor = "#FFFFFFFF",
            text = " ",
            layout_height = "40dp",
            layout_gravity = "center",
            gravity = "center",
            textSize = "15dp"
          }
        }
      },
      {
        LinearLayout,
        layout_width = "110dp",
        id = "linecd1",
        gravity = "center",
        background = "#FFFFFFFF",
        {
          CardView,
          layout_marginBottom = "10dp",
          id = "gengxin",
          elevation = 0,
          layout_marginTop = "12dp",
          layout_gravity = "center",
          radius = "5dp",
          cardBackgroundColor = "#FFEC463A",
          {
            TextView,
            layout_width = "90dp",
            textColor = "#FFFFFFFF",
            text = "立即更新",
            layout_height = "40dp",
            id = "gx",
            layout_gravity = "center",
            gravity = "center",
            textSize = "15dp"
          }
        }
      }
    },
    {
      ImageView, -- 图片控件
      layout_width = '37dp', -- 图片宽度
      layout_height = '37dp', -- 图片高度
      src = 'xxx.png', -- 图片路径
      id = 'xxx', -- 设置控件ID
      -- ColorFilter='';--图片着色
      -- ColorFilter=Color.BLUE;--设置图片着色
      scaleType = 'fitXY', -- 图片拉伸
      layout_marginTop = "12dp",
      layout_gravity = 'center|bottom' -- 重力
    }
  }
  
require "import"
import "android.graphics.drawable.GradientDrawable"
-- 后续使用GradientDrawable相关代码

  dialog = AlertDialog.Builder(this)
  update_dialog = dialog.show()
  -- update_dialog.setCanceledOnTouchOutside(false)--设置点击外部区域不关闭弹窗
  -- update_dialog.setCancelable(false)--禁用返回键
  update_dialog.getWindow().setContentView(loadlayout(layout))
  import "android.graphics.drawable.ColorDrawable"
  update_dialog.getWindow().setBackgroundDrawable(ColorDrawable(0x00000000))

  圆角 = GradientDrawable()
  圆角.setShape(GradientDrawable.RECTANGLE)
  圆角.setColor(0xFFFFFFFF) -- 背景颜色
  圆角.setCornerRadii({0, 0, 0, 0, 15, 15, 0, 0})
  linecd1.setBackgroundDrawable(圆角)

  圆角1 = GradientDrawable()
  圆角1.setShape(GradientDrawable.RECTANGLE)
  圆角1.setColor(0xFFFFFFFF) -- 背景颜色
  圆角1.setCornerRadii({0, 0, 0, 0, 00, 00, 15, 15})
  linecd.setBackgroundDrawable(圆角1)

  function gengxin.onClick()
    print("正在前往更新")
  end

  function shaohou.onClick()
  print("下次是哪次，改天是哪天！")
  update_dialog.dismiss()
  end

  function xxx.onClick()
update_dialog.dismiss()
  end

end

--网络判断
local wl = activity.getApplicationContext().getSystemService(Context.CONNECTIVITY_SERVICE).getActiveNetworkInfo()
if wl == nil then
  task(2000, function() -- 如果没有联网，远程文件直接执行是会报错的，进行错误处理
    print("网络异常，无法获取最新消息")
  end)
else
  -- 延迟载入更新弹窗，照顾到会有启动动画
  task(1500, function() -- 延迟1500毫秒执行事件
    
require "import"--获取远程文本数据开始
import "android.content.Intent"
import "android.net.Uri"
import "com.google.android.material.dialog.MaterialAlertDialogBuilder"
import "com.androlua.Http"
packinfo = this.getPackageManager().getPackageInfo(this.getPackageName(), ((32552732/2/2-8183)/10000-6-231)/9)
当前版本 = tostring(packinfo.versionName)
Http.get("https://baiyinet.github.io/rewards/update/text.lua", nil, nil, nil,function(code, content)
  if code == 200 then
    content = content:gsub("。", "\n") or content
    更新 = content:match("【版本】(.-)【版本】")
    版本 = content:match("【版本】(.-)【版本】")
    大小 = content:match("【软件大小】(.-)【软件大小】")
    文本 = content:match("【内容】(.-)【内容】")
    if 更新 <= 当前版本 then
      --print("恭喜，当前是最新版本")
    else
      -- 传递提取的信息到更新弹窗函数
      更新弹窗(版本, 大小, 文本)
    end
  else
    print("服务器连接超时")
  end
end)--获取远程文本数据结束

  end)
end

