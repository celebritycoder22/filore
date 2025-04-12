import 'package:filore/src/core/models/photo_collection_model.dart';
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
            isVerified: true,
            photos: [
              Photo(
                id: 'uya38h838',
                photoUrl: nadoDrive,
                likeCount: 372888,
                commentCount: 6728,
                shareCount: 900,
                bookmarkCount: 201,
              ),
              Photo(
                id: 'njsfalk',
                photoUrl: train,
                likeCount: 50232,
                commentCount: 13094,
                shareCount: 2019,
                bookmarkCount: 1739,
              ),
              Photo(
                id: 'jsad',
                photoUrl: crossing,
                likeCount: 20000000,
                commentCount: 700000,
                shareCount: 429999,
                bookmarkCount: 30000,
              ),
              Photo(
                id: 'hv6sta',
                photoUrl: maltese,
                caption: 'maltese',
                likeCount: 50999,
                commentCount: 6839,
                shareCount: 900,
                bookmarkCount: 10000,
              ),
              Photo(
                id: 'bsajjh1',
                photoUrl: pool,
                caption: 'pool',
                likeCount: 450000000,
                commentCount: 22000000,
                shareCount: 763000,
                bookmarkCount: 120000,
              ),
              Photo(
                id: 'sbkj',
                photoUrl: forest,
                caption: 'forest hollows',
                likeCount: 7388,
                commentCount: 100,
                shareCount: 200,
                bookmarkCount: 90,
              ),
              Photo(
                id: 'nbsajvg',
                photoUrl: woods,
                caption: 'the woods',
                likeCount: 9500000,
                commentCount: 54000,
                shareCount: 7000,
                bookmarkCount: 23000,
              ),
              Photo(
                id: 'sda5sdj',
                photoUrl: dash,
                caption: 'dashing cars',
                likeCount: 100,
                commentCount: 12,
                shareCount: 2000,
                bookmarkCount: 4000,
              ),
              Photo(
                id: 'hfbhas',
                photoUrl: city,
                caption: 'through the city',
                likeCount: 9300,
                commentCount: 500,
                shareCount: 800,
                bookmarkCount: 3000,
              ),
              Photo(
                id: 'ta8js',
                photoUrl: mountain,
                caption: 'foggy hills',
                likeCount: 400,
                commentCount: 120,
                shareCount: 800,
                bookmarkCount: 200,
              ),
              Photo(
                id: '2xa',
                photoUrl: blur,
                caption: 'the calm',
                likeCount: 800,
                commentCount: 67,
                shareCount: 100,
                bookmarkCount: 80,
              ),
              Photo(
                id: 'amsie',
                photoUrl: lake,
                caption: 'lake verda',
                likeCount: 500,
                commentCount: 22,
                shareCount: 200,
                bookmarkCount: 410,
              ),
              Photo(
                id: '52hs',
                photoUrl: tree,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: 'ri23',
                photoUrl: ripple,
                caption: 'ripple',
                likeCount: 100,
                commentCount: 12,
                shareCount: 2000,
                bookmarkCount: 4000,
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
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: '3ga',
                photoUrl: canoe,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: 'lv22',
                photoUrl: love,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
            ],
          ),

          //fourth user
          UserModel(
              name: 'Amber',
              username: 'amber22',
              profilePhoto: amber,
              id: 'am3e3',
              isVerified: true,
              photos: [
                Photo(
                  id: '1sad',
                  photoUrl: cabin,
                  likeCount: 190,
                  commentCount: 77,
                  shareCount: 430,
                  bookmarkCount: 23,
                ),
              ]),

          //fifth user
          UserModel(
            name: 'abby',
            username: 'abby_shots',
            profilePhoto: abby,
            isVerified: true,
            photos: [
              Photo(
                id: 'pusad',
                photoUrl: party,
                caption: 'party at Oslo',
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
            ],
          ),
        ],
        followers: [
          //first user
          UserModel(
            name: 'abby',
            username: 'abby_shots',
            profilePhoto: abby,
            isVerified: true,
            photos: [
              Photo(
                id: 'pusad',
                photoUrl: party,
                caption: 'party at Oslo',
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
            ],
          ),
          UserModel(
            name: 'Oliver',
            username: 'olly',
            profilePhoto: olly,
            id: 'olsad',
            isVerified: true,
            photos: [
              Photo(
                id: 'uya38h838',
                photoUrl: nadoDrive,
                likeCount: 372888,
                commentCount: 6728,
                shareCount: 900,
                bookmarkCount: 201,
              ),
              Photo(
                id: 'njsfalk',
                photoUrl: train,
                likeCount: 50232,
                commentCount: 13094,
                shareCount: 2019,
                bookmarkCount: 1739,
              ),
              Photo(
                id: 'jsad',
                photoUrl: crossing,
                likeCount: 20000000,
                commentCount: 700000,
                shareCount: 429999,
                bookmarkCount: 30000,
              ),
              Photo(
                id: 'hv6sta',
                photoUrl: maltese,
                caption: 'maltese',
                likeCount: 50999,
                commentCount: 6839,
                shareCount: 900,
                bookmarkCount: 10000,
              ),
              Photo(
                id: 'bsajjh1',
                photoUrl: pool,
                caption: 'pool',
                likeCount: 450000000,
                commentCount: 22000000,
                shareCount: 763000,
                bookmarkCount: 120000,
              ),
              Photo(
                id: 'sbkj',
                photoUrl: forest,
                caption: 'forest hollows',
                likeCount: 7388,
                commentCount: 100,
                shareCount: 200,
                bookmarkCount: 90,
              ),
              Photo(
                id: 'nbsajvg',
                photoUrl: woods,
                caption: 'the woods',
                likeCount: 9500000,
                commentCount: 54000,
                shareCount: 7000,
                bookmarkCount: 23000,
              ),
              Photo(
                id: 'sda5sdj',
                photoUrl: dash,
                caption: 'dashing cars',
                likeCount: 100,
                commentCount: 12,
                shareCount: 2000,
                bookmarkCount: 4000,
              ),
              Photo(
                id: 'hfbhas',
                photoUrl: city,
                caption: 'through the city',
                likeCount: 9300,
                commentCount: 500,
                shareCount: 800,
                bookmarkCount: 3000,
              ),
              Photo(
                id: 'ta8js',
                photoUrl: mountain,
                caption: 'foggy hills',
                likeCount: 400,
                commentCount: 120,
                shareCount: 800,
                bookmarkCount: 200,
              ),
              Photo(
                id: '2xa',
                photoUrl: blur,
                caption: 'the calm',
                likeCount: 800,
                commentCount: 67,
                shareCount: 100,
                bookmarkCount: 80,
              ),
              Photo(
                id: 'amsie',
                photoUrl: lake,
                caption: 'lake verda',
                likeCount: 500,
                commentCount: 22,
                shareCount: 200,
                bookmarkCount: 410,
              ),
              Photo(
                id: '52hs',
                photoUrl: tree,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: 'ri23',
                photoUrl: ripple,
                caption: 'ripple',
                likeCount: 100,
                commentCount: 12,
                shareCount: 2000,
                bookmarkCount: 4000,
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
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: '3ga',
                photoUrl: canoe,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
              Photo(
                id: 'lv22',
                photoUrl: love,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
              ),
            ],
          ),

          //fourth user
          UserModel(
              name: 'Amber',
              username: 'amber22',
              profilePhoto: amber,
              id: 'am3e3',
              isVerified: true,
              photos: [
                Photo(
                  id: '1sad',
                  photoUrl: cabin,
                  likeCount: 190,
                  commentCount: 77,
                  shareCount: 430,
                  bookmarkCount: 23,
                ),
              ]),
        ],

        //collections
        collections: [
          PhotoCollection(
            name: 'Nevada shutters',
            id: 'sjak',
            // createdBy: UserData.usersList[0],
            photos: [
              Photo(
                id: 'lv22',
                photoUrl: love,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
                hashtags: ['love', 'relationships'],
              ),
              Photo(
                id: 'njsfalk',
                photoUrl: train,
                likeCount: 50232,
                commentCount: 13094,
                shareCount: 2019,
                bookmarkCount: 1739,
                hashtags: ['train', 'transportation'],
              ),
              Photo(
                id: 'jsad',
                photoUrl: crossing,
                likeCount: 20000000,
                commentCount: 700000,
                shareCount: 429999,
                bookmarkCount: 30000,
                hashtags: ['city', 'coat'],
              ),
            ],
          ),
          //second collection
          PhotoCollection(
            name: 'Cars',
            id: 'sjak',
            // createdBy: UserData.usersList[0],
            photos: [
              Photo(
                id: 'uya38h838',
                photoUrl: nadoDrive,
                likeCount: 372888,
                commentCount: 6728,
                shareCount: 900,
                bookmarkCount: 201,
                hashtags: ['car', 'drive'],
              ),
              Photo(
                id: 'sda5sdj',
                photoUrl: dash,
                caption: 'dashing cars',
                likeCount: 100,
                commentCount: 12,
                shareCount: 2000,
                bookmarkCount: 4000,
                hashtags: ['car', 'drive'],
              ),
              Photo(
                id: '3ga',
                photoUrl: canoe,
                likeCount: 190,
                commentCount: 77,
                shareCount: 430,
                bookmarkCount: 23,
                hashtags: ['canoe', 'river'],
              ),
            ],
          ),
        ]),

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
