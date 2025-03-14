import 'package:filore/src/core/models/photo_model.dart';
import 'package:filore/src/core/models/user_model.dart';
import 'package:filore/src/utils/constants/images.dart';

class UserData {
  UserData._();

  //list of UserModels
  static final List<UserModel> usersList = [
    //logged in user for now
    UserModel(
      name: 'Klyde',
      username: 'klyde',
      profilePhoto: klyde,
      id: 'kld22',
      isVerified: true,
      photos: [
        Photo(
          id: '4dsa',
          photoUrl: mirrorLady,
          caption: 'lipstip',
        ),
        Photo(
          id: '3dsaf',
          photoUrl: london,
        ),
        Photo(
          id: '23sa',
          photoUrl: dog,
          caption: 'Mr Sanders',
        ),
        Photo(
          id: 'ybsa',
          photoUrl: windowLady,
          caption: 'out of the window',
        ),
        //followers list
      ],
      following: [
        UserModel(
          name: 'Oliver',
          username: 'olly',
          profilePhoto: olly,
          id: 'olsad',
          photos: [
            Photo(
              id: 'sda5sdj',
              photoUrl: dash,
              caption: 'dashing cars',
            ),
            Photo(
              id: 'bsajjh1',
              photoUrl: woods,
              caption: 'the woods',
            ),
            Photo(
              id: 'hfbhas',
              photoUrl: city,
              caption: 'through the city',
            ),
            Photo(
              id: 'hfbhas',
              photoUrl: city,
              caption: 'through the city',
            ),
            Photo(
              id: 'ta8js',
              photoUrl: mountain,
              caption: 'foggy hills',
            ),
            Photo(
              id: '2xa',
              photoUrl: blur,
              caption: 'the calm',
            ),
            Photo(
              id: 'amsie',
              photoUrl: lake,
              caption: 'lake verda',
            ),
            Photo(
              id: '52hs',
              photoUrl: tree,
            ),
            Photo(
              id: 'ri23',
              photoUrl: ripple,
              caption: 'ripple',
            ),
          ],
        ),
        UserModel(
          name: 'Lulu',
          username: 'luluwills',
          profilePhoto: lulu,
          id: 'lul3e3',
          photos: [
            Photo(
              id: 'kfasf',
              photoUrl: dock,
            ),
            Photo(
              id: 'jsad',
              photoUrl: crossing,
            ),
            Photo(
              id: '3ga',
              photoUrl: canoe,
            ),
            Photo(
              id: 'lv22',
              photoUrl: love,
            ),
          ],
        ),

        //fourth user
        UserModel(
            name: 'Amber',
            username: 'amber22',
            profilePhoto: amber,
            id: 'am3e3',
            photos: [
              Photo(
                id: '1sad',
                photoUrl: cabin,
              ),
            ]),

        //fifth user
        UserModel(
            name: 'abby',
            username: 'abby_shots',
            profilePhoto: abby,
            photos: [
              Photo(
                id: 'pusad',
                photoUrl: party,
                caption: 'party at Oslo',
              ),
            ]),
      ],
    ),

//***************************************** */
    //second user
    UserModel(
      name: 'Oliver',
      username: 'olly',
      profilePhoto: olly,
      id: 'olsad',
      photos: [
        Photo(
          id: '52hs',
          photoUrl: tree,
        ),
        Photo(
          id: '2xa',
          photoUrl: blur,
          caption: 'the calm',
        ),
      ],
    ),
    //third user
    UserModel(
        name: 'Lulu',
        username: 'luluwills',
        profilePhoto: lulu,
        id: 'lul3e3',
        photos: [
          Photo(
            id: 'jsad',
            photoUrl: crossing,
          ),
          Photo(
            id: '3ga',
            photoUrl: canoe,
          ),
        ]),

    //fourth user
    UserModel(
        name: 'Amber',
        username: 'amber22',
        profilePhoto: amber,
        id: 'am3e3',
        photos: [
          Photo(
            id: '1sad',
            photoUrl: cabin,
          ),
        ]),

    //fifth user
    UserModel(
        name: 'abby',
        username: 'abby_shots',
        profilePhoto: abby,
        photos: [
          Photo(
            id: 'pusad',
            photoUrl: party,
            caption: 'party at Oslo',
          ),
        ]),
  ];
}
