import 'app_constant.dart';

abstract class AppString {
  static const String appTitle = 'Game On';

  static const String loremIpsum =
      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';

  ///Validation Messages
  ///Error Notification message
  ///Shows when parse message from api failed.
  static const somethingWrongTryAgainAfterSometime =
      'Oops, something went wrong..! Try again after sometime';

  /// Shows when response is null.
  static const noResponseMessage = connectionError;

  /// Shows when api status = 404.
  static const pageNotFound =
      "Unable to resolve the request! Please try again after sometime.";

  /// Shows when user is inactive while home.
  static const contactAdministratorMessage =
      "Please Contact Your Administrator";

  /// Shows when response code is null.
  static const serverError = "Unable to connect.";

  /// Shows when server throws error.
  static const connectionError =
      "Server connection failed,please try again later.";

  /// Shows when response code is 301.
  static const connectionErrorMovedTemporary =
      "Temporary Moved to new Location";

  /// Notification success Messages
  /// Shows when profile uploaded successfully.
  static const profilePictureSuccess =
      'Your profile image has been updated successfully.';

  /// Shows when password changed
  static const passwordChangeSuccessMessage =
      "Password has been changed successfully.";

  /// message shows when file downloading notification is in process.
  static const fileDownloadingMessage =
      "Your file is downloading. Check the notification panel for the status of the process";

  /// No internet notification title
  static const noInternet = "No Internet";

  /// Shows when no internet message.
  static const noInternetMessage =
      "Unable to connect internet. Please check your network";

  /// Shows when contract is not available
  static const contractNotAvailable =
      "Contract not available at this moment. Please try again after sometime.";

  /// Shows when user account is inactive
  static const accountInactive = "Account Inactive!";

  static const userNotFound = "User not found! Please check your credentials";

  static const resendOTPSuccess = "New OTP has been sent to your email.";

  static const resetPasswordConfirmation =
      "Your password is changed! Please home to continue.";

  static const deleteBoardMemberConfirmationMessage =
      "Are you sure you want to delete this member?";

  static const removeClubProfileConfirmation =
      "Are you sure you want to remove this logo?";

  /// Shows club detail edit success
  static const detailsUpdateSuccess =
      "Your details have been updated successfully.";

  /// Shows club detail edit success
  static const profileUpdateSuccess =
      "Your profile have been updated successfully.";

  static const clubSignupSuccessMessage =
      "Congratulations! Your club is registered.";

  /// Shows when card is saved
  static const addCardSuccessMessage = "Card saved successfully.";

  /// Unfollow warning message
  static const unfollowPlayerWarningMessage =
      "Are you sure you want to unfollow this player?\nYou will no longer receive notifications about their activity.";

  /// Unfollow club warning message
  static const unfollowClubWarningMessage =
      "Are you sure you want to unfollow this club?\nYou will no longer receive notifications about their activity.";

  /// Add Post success Message
  static const addPostSuccessMessage =
      "Congratulations! Your post published successfully!";

  /// Update Post success Message
  static const updatePostSuccessMessage =
      "Congratulations! Your post updated successfully!";

  /// Add Event success Message
  static const addEventSuccessMessage =
      "Congratulations! Event published successfully!";

  /// Update Event success Message
  static const updateEventSuccessMessage =
      "Congratulations! Event updated successfully!";

  /// Add Result success Message
  static const addResultSuccessMessage =
      "Congratulations! Result published successfully!";

  /// Update Result success Message
  static const updateResultSuccessMessage =
      "Congratulations! Result updated successfully!";

  /// Add Open Position success Message
  static const addPositionSuccessMessage =
      "Congratulations! Open Position published successfully!";

  /// Update Open Position success Message
  static const updatePositionSuccessMessage =
      "Congratulations! Open Position updated successfully!";

  /// Discard post user warning message
  static const discardPostMessage =
      "Are you sure you want to discard this post?";

  /// Discard event user warning message
  static const discardEventMessage =
      "Are you sure you want to discard this event?";

  /// Discard result user warning message
  static const discardResultMessage =
      "Are you sure you want to discard this result?";

  /// Discard open position user warning message
  static const discardPosition =
      "Are you sure you want to discard this open position?";

  /// Logout message
  static const logOutMessage = "Are you sure you want to logout?";

  /// Delete account confirmation message
  static const deleteAccountConfirmationMessage =
      "Are you sure you want to delete your account?";

  /// Location permission dialog
  static const allowLocationPermissionFromSettings =
      "Please allow location permission from phone settings";

  static const deletePlayerFavouriteConfirmation =
      "Are you sure you want to delete from favourite list?";

  /// ----------------- Welcome Screen ------------------
  static const String strLogin = 'Login';
  static const String strSignUp = 'Sign Up';
  static const String welcomeMessage = 'Welcome to Game On!';
  static const String welcomeContent =
      'Let\'s get started! Whether you\'re a player or a club,\nGame On makes it easy to find what you\'re looking for.\nStart browsing now and find your perfect match!';

  static const String whoAreYou = 'Who are You?';
  static const String club = 'Club';
  static const String player = 'Player';
  static const String strNext = 'Next';
  static const String strSubmit = 'Submit';
  static const String strSave = 'Save';
  static const String strClubName = 'Club\'s Name';
  static const String strClubPhoneNumber = 'Club\'s Phone no.';
  static const String strClubAddress = 'Club\'s Address';
  static const String searchAddress = 'Search Address';
  static const String strClubEmail = 'Club\'s Email';
  static const String strPassword = 'Password';
  static const String strEmail = 'Email';
  static const String strContact = 'Contact';
  static const String strRole = 'Role';
  static const String clubVideo = 'Club\'s Video';
  static const String clubIntro = 'Club\'s Intro';
  static const String clubBio = 'Club\'s BIO';
  static const String clubPhoto = 'Upload Club\'s Photos';
  static const String clubOtherInformation = 'Club\'s Other Information';
  static const String clubContactInformation = 'Club\'s Contact Information';
  static const String addImages = 'Add images';
  static const String strSpeciality = 'Speciality';

  /// ----------------- Login Screen ------------------
  static const String strLoginInfo =
      'Please enter your home details below to start using app.';
  static const String strForgotPassword = 'Forgot Password?';
  static const String strSignUpAccount = 'Don’t have an account? Sign Up';

  /// ----------------- Forgot Screen ------------------
  static const String forgotPassword = 'Forgot Password';

  /// ----------------- Verification Screen ------------------
  static const String verification = 'Verification';
  static const String verificationMessage =
      'Enter the code from the email\nwe sent you';
  static const String resendText = 'I didn’t receive the code! Resend';
  static const String resend = 'Resend';

  /// ----------------- Create New Password ------------------
  static const String createNewPassword = 'Create New Password';
  static const String createNewPasswordInfoText =
      'Please make sure that the new password and \nconfirm password are the same.';
  static const String strUpdate = 'Update';
  static const String newPassword = 'New Password';
  static const String strConfirmPassword = 'Confirm Password';
  static const String strOldPassword = 'Existing Password';
  static const String strChangePassword = 'Change Password';

  static const passwordNotMatchedError = "Both Passwords are not matched.";

  /// ----------------- Club Signup ------------------

  static const String chooseYourClubSport = "Choose Your Club’s Sport";
  static const String chooseYourClubLocation = "Choose Your Club’s Location";
  static const String chooseLevel = "Choose Level";
  static const String whoCanPlay = "Who can Play?";
  static const String mens = "Men’s";
  static const String womens = "Women’s";

  ///----- Sports---------
  static const String strAFL = "AFL";
  static const String soccer = "Soccer";
  static const String basketball = "Basketball";
  static const String netball = "Netball";
  static const String cricket = "Cricket";

  ///----- Location---------
  static const String wa = "WA";
  static const String vic = "VIC";
  static const String tas = "TAS";
  static const String nsw = "NSW";
  static const String nt = "NT";
  static const String act = "ACT";
  static const String qld = "QLD";

  ///----- player type---------
  static const String male = "Male";
  static const String female = "Female";
  static const String jnrBoys = "Jnr. Boy";
  static const String jnrGirls = "Jnr. Girl";

  ///----- level---------
  static const String stateLeague = "State League";
  static const String amateurs = "Amateurs";
  static const String country = "Country";
  static const String masters = "Masters";
  static const String juniors = "Juniors";

  ///----- Player position---------
  static const String ruckMan = "Ruckman";
  static const String smallPressureFWD = "Small/Pressure Fwd";
  static const String tallFwd = "Tall Fwd";
  static const String hybridFWD = "Hybrid Fwd";
  static const String insideMid = "Inside Mid";
  static const String outsideMid = "Outside Mid";
  static const String hybridMid = "Hybrid Mid";

  /// ----------------- Club Board Members ------------------
  static const String clubBoardMembers = "Club’s Board Members";
  static const String presidentName = "President Name";
  static const String directors = "Directors";
  static const String plusAdd = "+Add";
  static const String noPresidentMessage = "No president added yet!";
  static const String noDirectorMessage = "No directors added yet!";
  static const String noCoachMessage = "No coaching staff added yet!";
  static const String addOtherMembers = "No members added yet!";
  static const String skip = "Skip";
  static const String addDirector = "Add Director";
  static const String addDirectors = "Add Directors";
  static const String addPresident = "Add President";
  static const String addOtherContactInfo = "Add Other Contact Info";
  static const String editOtherContactInfo = "Update Other Contact Info";
  static const String editDirector = "Update Director";
  static const String editPresident = "Update President";

  /// ----------------- Club Form ------------------
  static const String name = "Name";
  static const String email = "Email";
  static const String contact = "Contact";
  static const String role = "Role";
  static const String strNo = "No";
  static const String strYes = "Yes";
  static const String updateClubInformation = "Update Club’s Info";
  static const String updateBoardMembers = "Update Administration";
  static const String updateCoachingStaff = "Update Coaching Staff";
  static const String updateContactInformation = "Club's Contact Information";
  static const String managePost = "Manage Post";
  static const String updateCluSetting = "Update Club’s Setting";
  static const String changePassword = "Change Password";
  static const String manageSubscriptions = "Manage Subscriptions";
  static const String deleteAccount = "Delete Account";
  static const String editProfile = "Edit Profile";
  static const String logout = "Logout";

  /// ----------------- Manage Post ------------------
  static const String searchByNameAndLocation = "Search by name and location..";
  static const String searchByPostDetail = "Search by post detail..";
  static const String strEdit = "Edit";
  static const String strDelete = "Delete";
  static const String strFilter = "Filter";
  static const String applyFilter = "Apply";
  static const String strClearAll = "Clear All";
  static const String strEvent = "Event";
  static const String strResult = "Result";
  static const String strPost = "Post";
  static const String strOpenPositions = "Open Positions";
  static const String strOpenPosition = "Open Position";
  static const String addOpenPosition = "Add Open Position";
  static const String updateOpenPosition = "Update Open Position";
  static const String strActiveSubscription = "Active Subscriptions";
  static const String strYearly = "Yearly";
  static const String strMonthly = "Monthly";
  static const String strNextPaymentIn = "Next Payment in ";
  static const String strFree = "Free";
  static const String strUpgrade = "Upgrade";
  static const String strRenew = "Renew";

  /// ----------------- Home screen ------------------
  static String home = "Home";
  static String favourite = "Favourite";
  static String favouritePlayers = "Favourite Players";
  static String favouriteClubs = "Favourite Clubs";
  static String chat = "Chat";
  static String profile = "My Profile";
  static String favourites = "Favourites";
  static String property = "Property";
  static String searchTextHint = "Search by name and locations";

  static String recentActivity = "Recent Activity";
  static String post = "Post";

  static String following = "Following";
  static String strFollow = "Follow";
  static String followers = "Followers";
  static String messages = "Message";
  static String bio = "Bio";

  static String height = "Height";
  static String weight = "Weight";

  static String moreInformation = "More Information";
  static String location = "Location";
  static String locations = "Locations";
  static String level = "Level";
  static String levels = "Levels";
  static String sports = "Sports";
  static String preferredLocation = "Preferred Location";
  static String preferredPositions = "Preferred Positions";
  static String noActivityFound = "No result found!";
  static String noPlayerFound = "No result found!";
  static String changeFilterCriteriaMessage =
      "Please try again using different search filter.";
  static String changeFilter = "Modify Filter";
  static String clearFilter = "Clear Filter";

  static String strSearch = "Search";

  static String seeAllSearch = "See all Results";

  static const String noUserFound = "No result found";

  /// ----------------- Manage Post ------------------
  static const String subscriptionPlan = "Subscription Plan";
  static const String choosePaidPlanForYou = "Choose paid plan for you.";
  static const String choosePlan = "Choose Plan";

  /// ----------------- Payment Method ------------------
  static const String paymentMethod = "Payment Method";
  static const String strContinue = "Continue";
  static const String addNewCardWithPlus = "+ Add New Card";

  /// ----------------- Add Card screen ------------------
  static const String strCardNumber = "Card Number";
  static const String strExpDate = "Exp Date";
  static const String strCVV = "CVV";
  static const String saveCard = "Save Card";
  static const String addCard = "Add Card";
  static const String addNewCard = "Add New Card";

  /// ----------------- Order summary bottomsheet------------------
  static const String orderSummery = "Order summery";
  static const String strAmount = "Amount";
  static const String strTax = "Tax";
  static const String strTotal = "Total";
  static const String payNow = "Pay Now";
  static const String strDone = "Done";

  /// ----------------- Payment confirmation bottomsheet ------------------
  static const String paymentConformation = "Payment Confirmation";
  static const String paymentThankYouMessage =
      "Thank you for making the payment.\nA receipt will be sent to your email shortly.";

  /// ----------------- Subscription ------------------
  static const String subscription = "Subscription";
  static const String details = "Details";
  static const String averageMonthly = "Average monthly";
  static const String nextPayment = "Next payment";
  static const String firstPayment = "First payment";
  static const String previousPayment = "Previous Payments";
  static const String transaction = "Transaction";
  static const String cancelSubscriptionMessage =
      "If you cancel your subscription, you will have access to your paid plan until the end of your current billing cycle. On your renewal date, you will no longer have access to your premium plan features. Game On also does not typically offer refunds when you cancel your subscription.";
  static const String noPreviousTransaction = "No previous transaction yet.";

  /// ----------------- Add Post ------------------
  static const String addPostHintText = "What do you want to talk about?";
  static const String clickToAddPostImage = "Click here to add post image";

  /// ----------------- Add Event ------------------
  static const String addEvent = "Add Event";
  static const String updateEvent = "Update Event";
  static const String strTitle = "Title";
  static const String selectTime = "Select Time";
  static const String selectDate = "Select Date";
  static const String selectLocation = "Location";
  static const String typeOfEvent = "Type of Event";
  static const String participants = "Participants";
  static const String strVS = "VS";
  static const String otherDetails = "Other Details";
  static const String image = "Image";
  static const String clickTOAddEventImage = "Click here to add event image";

  /// ----------------- Add Result ------------------
  static const String addResult = "Add Result";
  static const String updateResult = "Update Result";
  static const String score = "Score";
  static const String highlights = "Highlights";
  static const String opponents = "Opponents";

  /// ----------------- Add other position------------------
  static const String positionName = "Position Name";
  static const String age = "Age";
  static const String gender = "Gender";
  static const String description = "Description";
  static const String reference = "References";
  static const String skill = "Skill";
  static String strCreateAPost = "Create a Post";
  static String strAddPost = "Add Post";

  /// ----------------- Chat Main Page ------------------
  static String noMessageTitle = "You don\'t have any message.";
  static String noMessageInformationText =
      "Connect with any player and start conversation with them.";
  static String strSearchPlayer = "Search Player";
  static String strSearchClub = "Search Club";

  /// ----------------- Private Chat ------------------
  static String typeMessageHintText = "Write a message";
  static String strClearChat = "Clear Chat History";
  static String strDeleteChat = "Delete Chat";
  static String strReport = "Report";
  static String strViewProfile = "View Profile";

  ///Notification screen
  static const String notification = "Notification";
  static const String readAll = "Read All";

  /// favorite players screen
  static var myFavoritePlayers = "My Favorite Players";
  static var highPriorityPlayers = "High Priority Players";
  static var bestPlayers = "Best Players";
  static var famous = "Famous";
  static var bestSkills = "Best Skills";
  static var favoriteList = "Favorite Lists";

  /// -------------- Form Validation Error Messages ------------
  static const String fieldDoesNotEmptyMessage = 'Field must not be empty.';
  static const String pleaseEnterValidPhoneNumber =
      'phone number should be between 7 to 15 digits';
  static const String pleaseEnterValidEmailAddress =
      'Please enter valid email address.';
  static const String invalidPasswordMessage =
      'Password must contain at least one uppercase, lowercase, numeric value, special character.';

  static const photoPermission = "Photo Permission";
  static const cancel = "Cancel";
  static const openSettings = "Open Settings";
  static const settings = "Settings";
  static const enablePhotoPermissionFromPhoneSettings =
      "Enable photo permission from phone setting?";
  static const cameraPermission = "Camera Permission";
  static const enableCameraPermissionFromPhoneSetting =
      "Enable camera permission from phone setting?";

  static var chooseDifferent = "Choose Different";
  static var chooseFromGallery = "Load from library";
  static var captureUsingCamera = "Use Camera";

  static var remove = "Remove";
  static var removeSelectedProfile = "Remove Selected Profile";
  static var selectImageSource = "Select Image Source";

  static const error = "Error";
  static const unfollow = "Unfollow";
  static const block = "Block";
  static const report = "Report";

  /// --------------- Card Types
  static const MASTER_CARD = 'MasterCard';
  static const MAESTRO_CARD = 'Maestro';
  static const RUPEY_CARD = 'Rupey';
  static const OTHER_CARD = 'Other';
  static const VISA_CARD = 'Visa';

  /// ----------------- Player Signup ------------------
  static const String chooseYourSport = "Choose Your Sport";
  static const String chooseYourLocation = "Choose Your Location";
  static const String currentLocation = "Current Location";
  static const String locationSelectionMessage =
      "Please select any one location from given list";

  /// ----------------- Player Signup ------------------
  static const String strOkay = "Okay";
  static const String strDateOfBirth = "Date of Birth";
  static const String experience = "Experience";
  static const String strGender = "Gender";
  static const String phoneNo = "Phone No.";
  static const String video = 'Video';
  static const String intro = 'Intro';
  static const String additionalPhotos = 'Additional Photos';
  static const String photos = 'Photos';

  /// ----------------- player Form ------------------

  static var updatePersonalInformation = "Update Personal Info";
  static var updateSettings = "Update Setting";
  static var profilePrivacy = "Profile Privacy";

  static String profileHidePreference = "Profile Hide Preference";

  static String profileHidePreferenceDes =
      "Your profile is visible to all clubs.";

  static var none = "None";
  static var onlyForSelectedClub = "Only for Selected Clubs";
  static var forAllClubs = "For All Clubs";

  static var hideForAllClubMessage =
      "Are you sure you want to hide your profile for all clubs? ";

  static var hideFromSelectedClubMessage =
      "Are you sure you want to hide Your profile for selected clubs?";

  static var hideFromClubTitle = "Hide For Selected Clubs";

  static String allClubHiddenMessage =
      "Your profile is hidden from all the clubs.";

  static String selectedClubHidden =
      "Your profile is hidden from the bellow clubs. Click on more and select more clubs";

  static String selectedClubHiddenList =
      "Your profile is hidden from the selected clubs.";

  /// select club
  static var selectClub = "Select Club";

  /// textField hint text
  static var srtClubNameHint = "Club Name";
  static var strPhoneNoHint = "Phone Number";
  static var strClubAddressHint = "Enter your club's address";
  static var strClubEmailHint = "Email";
  static var strClubPasswordHint = "Password";
  static var strClubVideoHint = "Club youtube video url";
  static var strVideoHint = "Your youtube video URL";
  static var strClubIntroHint = "Share your club introduction";
  static var videoURLErrorMessage = "Please enter valid video URL";
  static var strClubBioHint =
      "Share your club's achievements, history and more";
  static var strClubOtherInfoHint = "Other club's detail";
  static var strPlayerIntroHint = "Share your introduction";
  static var strPlayerBioHint = "Share your achievements, history and more";
  static var strPlayerOtherInfoHint = "Other details";
  static var strPlayerNameHint = "Tell us your name";

  static var timeHint = "HH:MM";
  static var dateHint = "DD/MM/YYYY";
  static String heightHint = "Height";
  static String weightHint = "Weight";

  static const String noClubFound = "No result found";
  static const String clubProfile = "Club Profile";
  static const String otherInformation = "Other Information";
  static const String otherContactInformation = "Other Contact Information";
  static const String coachingStaff = "Coaching Staff";
  static const String addCoachingStaff = "Add Coaching Staff";
  static const String strViewAll = "View All";
  static const String administration = "Administration";
  static const String strFavouriteTo = "Favourite to...";
  static const String strAddNewList = "Add New List";
  static const String listName = "List Name";

  static String thirtyDaysTrialStr = "30 days free trial";

  static String strSubscriptionPlan = "then \$4.99 per month";
  static String strCancelAnytimePlan = "You can cancel subscription anytime.";

  static var discardLocationText =
      "Are you sure you want to delete this location?";

  static const imageMaxLengthExceed =
      "You can only add maximum ${AppConstants.MULTI_IMAGE_MAX_SIZE} images.";

  static String strAddImages = "Add Images";
}
