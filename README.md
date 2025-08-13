# Fix VS Code GitHub Authentication on Linux

## English

### The Problem
When attempting to sign in to GitHub Copilot in Visual Studio Code on Linux distributions (e.g., EndeavourOS, based on Arch Linux), you may encounter the following error:
```
Could not read file vscode://vscode.github-authentication/did-authenticate
```
This error occurs because the system cannot properly handle `vscode://` URIs, often due to missing or incorrect configurations for URI handling.

### Purpose of the Script
The `fix-vscode-github-auth.sh` script aims to resolve this issue by:
1. Installing required dependencies (`qt5-tools` and `xdg-utils`) to address issues like `qtpaths: command not found`.
2. Creating a `.desktop` file to handle `vscode://` URIs and direct them to VS Code.
3. Registering the `.desktop` file and updating the desktop database.
4. Associating `vscode://` URIs with the `.desktop` file using `xdg-mime`.
5. Testing the configuration to ensure it works correctly.

### Prerequisites
- A Linux distribution (e.g., EndeavourOS or Arch Linux).
- Visual Studio Code installed at `/opt/vscode/code`.
- GitHub Copilot extension installed in VS Code.
- `sudo` privileges for installing packages.
- A terminal open in the user's home directory.

### Usage Instructions
1. **Save the Script**:
   - Copy the contents of `fix-vscode-github-auth.sh` into a new file named `fix-vscode-github-auth.sh`. You can use a text editor like `nano`:
     ```bash
     nano fix-vscode-github-auth.sh
     ```
     Paste the contents, save (Ctrl+O, Enter), and exit (Ctrl+X).

2. **Make the Script Executable**:
   ```bash
   chmod +x fix-vscode-github-auth.sh
   ```

3. **Run the Script**:
   ```bash
   ./fix-vscode-github-auth.sh
   ```

4. **What the Script Does**:
   - Installs required packages (`qt5-tools` and `xdg-utils`).
   - Creates a `code-url-handler.desktop` file in `~/.local/share/applications/` with the correct settings to launch VS Code for `vscode://` URIs.
   - Updates the desktop database.
   - Associates `vscode://` URIs with `code-url-handler.desktop`.
   - Tests the setup by opening a `vscode://test` URI.

5. **Test GitHub Copilot Login**:
   - Open VS Code:
     ```bash
     /opt/vscode/code
     ```
   - Attempt to sign in to GitHub Copilot via the Status Bar or the Copilot extension.
   - If a `vscode://vscode.github-authentication/did-authenticate?...` link appears in the browser, copy and paste it into VS Code if prompted.

### Expected Output
- When running the script, if you see:
  ```
  Checking MIME association for vscode://
  code-url-handler.desktop
  ```
  This indicates the configuration is correct.
- When running `xdg-open vscode://test`, VS Code should open.
- If successful, you should be able to sign in to GitHub Copilot without the original error.

### Troubleshooting
If any issues arise:
- Check the contents of `code-url-handler.desktop`:
  ```bash
  cat ~/.local/share/applications/code-url-handler.desktop
  ```
  Ensure it does not contain words like `EOF` within the content.
- Verify the MIME association:
  ```bash
  xdg-mime query default x-scheme-handler/vscode
  ```
- Check the VS Code version:
  ```bash
  /opt/vscode/code --version
  ```
- Share any error messages from the Terminal or the VS Code Output Console (View → Output → GitHub Authentication).
- 
- 
- ---
## العربية

### المشكلة
عند محاولة تسجيل الدخول إلى GitHub Copilot في Visual Studio Code على توزيعات لينكس (مثل EndeavourOS المبنية على Arch Linux)، قد يظهر الخطأ التالي:
```
Could not read file vscode://vscode.github-authentication/did-authenticate
```
هذا الخطأ يحدث بسبب عدم قدرة النظام على التعامل مع روابط `vscode://` بشكل صحيح، وذلك بسبب إعدادات خاطئة أو مفقودة لمعالجة الروابط (URI handling) في النظام.

### الهدف من السكربت
السكربت `fix-vscode-github-auth.sh` يهدف إلى حل هذه المشكلة عن طريق:
1. تثبيت التبعيات اللازمة (`qt5-tools` و `xdg-utils`) لحل مشكلة `qtpaths: command not found`.
2. إنشاء ملف `.desktop` للتعامل مع روابط `vscode://` وتوجيهها إلى VS Code.
3. تسجيل الملف في النظام وتحديث قاعدة بيانات سطح المكتب.
4. ربط روابط `vscode://` بملف `.desktop` باستخدام `xdg-mime`.
5. اختبار الإعدادات والتأكد من أنها تعمل بشكل صحيح.

### متطلبات التشغيل
- توزيعة لينكس (مثل EndeavourOS أو Arch Linux).
- Visual Studio Code مثبت في المسار `/opt/vscode/code`.
- إضافة GitHub Copilot مثبتة في VS Code.
- صلاحيات `sudo` لتثبيت الحزم.
- الـ Terminal مفتوح في دليل المستخدم.

### طريقة الاستخدام
1. **حفظ السكربت**:
   - انسخ محتوى ملف `fix-vscode-github-auth.sh` إلى ملف جديد باسم `fix-vscode-github-auth.sh`. يمكنك استخدام محرر مثل `nano`:
     ```bash
     nano fix-vscode-github-auth.sh
     ```
     الصق المحتوى، احفظ (Ctrl+O ثم Enter)، واخرج (Ctrl+X).

2. **إعطاء صلاحيات التنفيذ**:
   ```bash
   chmod +x fix-vscode-github-auth.sh
   ```

3. **تشغيل السكربت**:
   ```bash
   ./fix-vscode-github-auth.sh
   ```

4. **ماذا يفعل السكربت؟**
   - يثبت الحزم المطلوبة (`qt5-tools` و `xdg-utils`).
   - ينشئ ملف `code-url-handler.desktop` في `~/.local/share/applications/` مع الإعدادات الصحيحة لتشغيل VS Code عند فتح روابط `vscode://`.
   - يحدث قاعدة بيانات سطح المكتب.
   - يربط روابط `vscode://` بملف `code-url-handler.desktop`.
   - يختبر الإعداد بفتح رابط `vscode://test`.

5. **اختبار تسجيل الدخول**:
   - افتح VS Code:
     ```bash
     /opt/vscode/code
     ```
   - حاول تسجيل الدخول إلى GitHub Copilot من خلال الـ Status Bar أو إضافة GitHub Copilot.
   - لو ظهر رابط `vscode://vscode.github-authentication/did-authenticate?...` في المتصفح، انسخه والصقه في VS Code إذا طُلب منك.

### مخرجات متوقعة
- عند تشغيل السكربت، إذا ظهرت رسالة:
  ```
  Checking MIME association for vscode://
  code-url-handler.desktop
  ```
  فهذا يعني أن الإعدادات صحيحة.
- عند تشغيل `xdg-open vscode://test`، يجب أن يفتح VS Code.
- إذا نجحت الخطوات، يجب أن تتمكن من تسجيل الدخول إلى GitHub Copilot بدون الخطأ الأصلي.

### استكشاف الأخطاء وإصلاحها
إذا ظهرت أي مشاكل:
- تحقق من محتوى ملف `code-url-handler.desktop`:
  ```bash
  cat ~/.local/share/applications/code-url-handler.desktop
  ```
  تأكد أنه لا يحتوي على كلمات مثل `EOF` داخل المحتوى.
- تحقق من ارتباط الروابط:
  ```bash
  xdg-mime query default x-scheme-handler/vscode
  ```
- تحقق من إصدار VS Code:
  ```bash
  /opt/vscode/code --version
  ```
- شارك أي رسائل خطأ تظهر في الـ Terminal أو في الـ Output Console في VS Code (View → Output → GitHub Authentication).

---
