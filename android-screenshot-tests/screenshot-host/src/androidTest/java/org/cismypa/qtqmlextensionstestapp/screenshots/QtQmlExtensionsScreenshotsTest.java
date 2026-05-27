package org.cismypa.qtqmlextensionstestapp.screenshots;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.platform.app.InstrumentationRegistry;
import androidx.test.uiautomator.By;
import androidx.test.uiautomator.UiDevice;
import androidx.test.uiautomator.UiObject2;
import androidx.test.uiautomator.Until;

import org.junit.ClassRule;
import org.junit.Test;
import org.junit.runner.RunWith;

import tools.fastlane.screengrab.Screengrab;
import tools.fastlane.screengrab.ScreenshotCallback;
import tools.fastlane.screengrab.UiAutomatorScreenshotStrategy;
import tools.fastlane.screengrab.locale.LocaleTestRule;

@RunWith(AndroidJUnit4.class)
public final class QtQmlExtensionsScreenshotsTest {
    private static final String DEFAULT_TARGET_PACKAGE = "org.cismypa.qtqmlextensionstestapp";
    private static final String DEFAULT_TARGET_ACTIVITY = "org.qtproject.qt.android.bindings.QtActivity";
    private static final String APPEND_TIMESTAMP_ARGUMENT = "appendTimestamp";
    private static final String SCREENSHOT_DIRECTORY_TYPE = "screengrab";
    private static final String SCREENSHOT_FILE_EXTENSION = ".png";
    private static final long LAUNCH_TIMEOUT_MS = 15000L;
    private static final long OBJECT_TIMEOUT_MS = 10000L;
    private static final long RENDER_SETTLE_MS = 750L;

    @ClassRule
    public static final LocaleTestRule localeTestRule = new LocaleTestRule();

    @Test
    public void capturePlayStoreScreenshots() throws Exception {
        UiDevice device = UiDevice.getInstance(InstrumentationRegistry.getInstrumentation());
        String targetPackage = argument("targetPackage", DEFAULT_TARGET_PACKAGE);
        String targetActivity = argument("targetActivity", DEFAULT_TARGET_ACTIVITY);

        launchTargetApp(device, targetPackage, targetActivity);
        capture(device, "01-navigation");

        openPage(device, "Controls");
        capture(device, "02-controls");
        goBack(device);

        openPage(device, "Colors");
        capture(device, "03-colors");
        goBack(device);

        openPage(device, "Layout");
        capture(device, "04-layout");
        goBack(device);

        openPage(device, "Fonts");
        capture(device, "05-fonts");
    }

    private static String argument(String name, String defaultValue) {
        String value = InstrumentationRegistry.getArguments().getString(name);
        return value == null || value.trim().isEmpty() ? defaultValue : value;
    }

    private static void launchTargetApp(UiDevice device, String targetPackage, String targetActivity) {
        Context context = InstrumentationRegistry.getInstrumentation().getContext();
        Intent intent = new Intent(Intent.ACTION_MAIN);
        intent.addCategory(Intent.CATEGORY_LAUNCHER);
        intent.setComponent(new ComponentName(targetPackage, targetActivity));
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);

        boolean packageVisible = device.wait(Until.hasObject(By.pkg(targetPackage)), LAUNCH_TIMEOUT_MS);
        assertTrue("Timed out waiting for " + targetPackage + " to become visible", packageVisible);
    }

    private static void openPage(UiDevice device, String label) throws InterruptedException {
        UiObject2 button = findByTextOrDescription(device, label);
        assertNotNull("Could not find navigation button: " + label, button);
        button.click();
        waitForRender(device);
    }

    private static void goBack(UiDevice device) throws InterruptedException {
        UiObject2 button = findByTextOrDescription(device, "Go back");
        assertNotNull("Could not find Go back button", button);
        button.click();
        waitForRender(device);
    }

    private static UiObject2 findByTextOrDescription(UiDevice device, String label) {
        UiObject2 object = device.wait(Until.findObject(By.text(label)), OBJECT_TIMEOUT_MS);
        if (object != null) {
            return object;
        }
        return device.wait(Until.findObject(By.desc(label)), OBJECT_TIMEOUT_MS);
    }

    private static void capture(UiDevice device, String name) throws InterruptedException {
        waitForRender(device);

        Context targetContext = InstrumentationRegistry.getInstrumentation().getTargetContext().getApplicationContext();
        Screengrab.screenshot(
            name,
            new UiAutomatorScreenshotStrategy(),
            new ExternalFilesScreenshotCallback(targetContext, Screengrab.getLocale()));
    }

    private static void waitForRender(UiDevice device) throws InterruptedException {
        device.waitForIdle();
        Thread.sleep(RENDER_SETTLE_MS);
    }

    private static final class ExternalFilesScreenshotCallback implements ScreenshotCallback {
        private final Context appContext;
        private final String locale;

        private ExternalFilesScreenshotCallback(Context appContext, String locale) {
            this.appContext = appContext;
            this.locale = locale;
        }

        @Override
        public void screenshotCaptured(String screenshotName, Bitmap screenshot) {
            if (screenshot == null) {
                throw new RuntimeException("Unable to capture screenshot: " + screenshotName);
            }

            File screenshotDirectory = getScreenshotDirectory();
            File screenshotFile = new File(screenshotDirectory, screenshotFileName(screenshotName));

            try (OutputStream output = new BufferedOutputStream(new FileOutputStream(screenshotFile))) {
                if (!screenshot.compress(Bitmap.CompressFormat.PNG, 100, output)) {
                    throw new IOException("Failed to encode screenshot: " + screenshotFile);
                }
            } catch (IOException error) {
                throw new RuntimeException("Unable to write screenshot: " + screenshotFile, error);
            } finally {
                screenshot.recycle();
            }
        }

        private File getScreenshotDirectory() {
            File root = appContext.getExternalFilesDir(SCREENSHOT_DIRECTORY_TYPE);
            if (root == null) {
                throw new RuntimeException("Unable to resolve external screenshot directory.");
            }

            File localeDirectory = new File(root, locale);
            File imagesDirectory = new File(localeDirectory, "images");
            File screenshotDirectory = new File(imagesDirectory, "screenshots");
            if (!screenshotDirectory.isDirectory() && !screenshotDirectory.mkdirs()) {
                throw new RuntimeException("Unable to create screenshot directory: " + screenshotDirectory);
            }
            return screenshotDirectory;
        }

        private static String screenshotFileName(String screenshotName) {
            String timestamp = shouldAppendTimestamp() ? "_" + System.currentTimeMillis() : "";
            return screenshotName + timestamp + SCREENSHOT_FILE_EXTENSION;
        }

        private static boolean shouldAppendTimestamp() {
            String value = InstrumentationRegistry.getArguments().getString(APPEND_TIMESTAMP_ARGUMENT);
            return Boolean.parseBoolean(value);
        }
    }
}
