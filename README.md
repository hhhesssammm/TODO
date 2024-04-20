# TODO
این یه پروژه لینوکس هست که توسط بش نوشته شده و در سه فاز ارايه میشه
فاز اول:
در ابتدا خوب است که با مفهوم برنامه‌های لیست انجام کار‌ها یا Todo List آشنا شویم. برنامه‌های Todo List برنامه‌هایی‌اند که می‌توان لیست کار‌هایی که می‌خواهید انجام دهید را در آن‌ها قرار دهید و هم‌چنین بتوانید این لیست را مدیریت کنید. نمونه‌ای از این برنامه‌ها را می‌توانید در لینک زیر مشاهده کنید.
https://todoist.com/
ما نیز قصد داریم ، برنامه Todo List را در محیط شل بنویسیم. این پروژه قرار است تا لیست کار‌ها را ذخیره و در نهایت دارای امکانات زیر باشد:
 -دیدن لیست کار‌ها
 -اولویت‌بندی کار‌ها
 -امکان اعلام انجام‌شدن کار
 -جستجو در کار‌ها
 -حذف کار‌ها
 
 بنابراین پروژه نهایی شامل دستورات زیر خواهد بود:
 
 -دستور add
 -دستور list
 -دستور done
 -دستور find
 -دستور clear
 
 در اولین قدم، ما قصد پیاده‌سازی دریافت دستورات و آپشن‌های مورد نیاز برنامه‌مان را داریم. بنابر‌این در اولین گام، برنامه ما باید بتواند از دستور add به‌گونه‌ای که در ادامه گفته می‌شود، پشتیبانی کند.

 دستور add دو آپشن t (--title)- و p (--priority)- دارد که اولین آپشن برای دریافت عنوان کار و دومین آپشن برای دریافت اولویت کار است. پس دستور add به‌صورت زیر در برنامه ما وارد می‌شود:

bash todo.sh add -t "First Task" -p H

با اجرای این دستور باید یک خط در فایل tasks.csv به‌صورت زیر اضافه شود:
0,H,"First Task"

در خروجی بالا 0 به‌معنی انجام نشدن کار، H به‌معنی اولویت High است.

برای تکمیل بخش اول باید قسمت‌های زیر را نیز در نظر بگیرید:
--وارد کردن عنوان الزامی است و اگر عنوان وارد نشده بود باید متن Option -t|--title Needs a Parameter چاپ (echo) شود
--وارد کردن اولویت اختیاری است و فقط می‌تواند مقادیر زیر را بپذیرد، اگر غیر از مقادیر زیر به عنوان اولویت برای این آپشن وارد شد، باید متن Option -p|--priority Only Accept L|M|H چاپ شود:
	-اولویت L به‌معنی Low
	-اولویت M به‌معنی Medium
	-اولویت H به‌معنی High
   نکته:در صورت وارد نشدن اولویت، باید L برای آن در نظر گرفته شود.
   مثال از دستور بدون آپشن اولویت:
   Terminal:
   bash todo.sh add -t "Fifth Task"
   
   tasks.csv:
   0,L,"Fifth Task"
   
   فاز دوم:

در دومین قدم از پیاده‌سازی پروژه، ما قصد پیاده‌سازی دو دستور list و clear را داریم. همان‌طور که از اسم این دو دستور مشخص است، دستور list تمامی کار‌های موجود در فایل tasks.csv را به ما نشان خواهد داد و دستور clear نیز تمام کار‌ها را از فایل tasks.csv پاک خواهد کرد.

پس سناریو زیر را باید برای نوشتن دستورات ذکر شده در نظر بگیرید:

فرض کنید ابتدا با دستورات زیر، کار‌هایی به فایل اضافه می‌شود:

Terminal:

bash todo.sh add -t "First Task" -p H
bash todo.sh add -t "Second Task" -p M
bash todo.sh add -t "Third Task" -p L
bash todo.sh add -t "Fourth Task" -p M

حال اگر دستور زیر وارد شود:

Terminal:

bash todo.sh clear

باید محتوای فایل tasks.csv خالی شود.

حال اگر مجدد دستورات زیر اجرا شود:

Terminal:

bash todo.sh add -t "First Task" -p H
bash todo.sh add -t "Second Task" -p M
bash todo.sh add -t "Third Task" -p L
bash todo.sh add -t "Fourth Task" -p M

سپس دستور زیر وارد شود:

Terminal:

bash todo.sh list

باید خروجی زیر دریافت شود:

1 | 0 | H | "First Task"
2 | 0 | M | "Second Task"
3 | 0 | L | "Third Task"
4 | 0 | M | "Fourth Task"

همان‌طور که در خروجی بالا مشخص است، نکته‌ای که در نمایش لیست وجود دارد این است که شما باید شماره خط هر کار در فایل tasks.csv را در خروجی نمایش دهید. از شماره خط در تمرین بعدی به‌عنوان آی‌دی هر کار استفاده خواهید کرد.

در انتهای این تمرین شما باید پروژه‌تان را طوری تنظیم کنید تا اگر دستوری غیر از دستوراتی که پیاده‌سازی می‌کنید وارد شد، متن Command Not Supported! چاپ (echo) شود





