import 'package:assigment/data/models/astrologer_model.dart';
import 'package:flutter/material.dart';

class AstroTile extends StatelessWidget {
  const AstroTile({Key? key, required this.astrologer}) : super(key: key);
  final AstrologerModelData astrologer;

  @override
  Widget build(BuildContext context) {
    List<String> laungages = [];
    List<String> skills = [];
    List<String> imageUrls = [];

    for (AstrologerModelLanguage element in (astrologer.languages ?? [])) {
      laungages.add(element.name ?? '');
    }

    for (AstrologerModelSkill element in (astrologer.skills ?? [])) {
      skills.add(element.name ?? '');
    }

    imageUrls.add(astrologer.images?.small?.imageUrl ?? '');
    imageUrls.add(astrologer.images?.medium?.imageUrl ?? '');
    imageUrls.add(astrologer.images?.large?.imageUrl ?? '');
    imageUrls.removeWhere((element) => element == '');

    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      leading: Image.network(
          imageUrls.isNotEmpty
              ? imageUrls[0]
              : 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1024px-Circle-icons-profile.svg.png',
          fit: BoxFit.cover, loadingBuilder: (BuildContext context,
              Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      }),
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
            '${astrologer.firstName ?? ""} ${astrologer.lastName ?? ""}',
            style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: const Icon(Icons.language), //icons not available in assets
            label: Text(skills.join(', '),
                style: Theme.of(context).textTheme.bodyText1),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon: const Icon(
                Icons.translate_outlined), //icons not available in assets

            label: Text(
              laungages.join(', '),
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: () {},
            icon:
                const Icon(Icons.phone_android), //icons not available in assets

            label: Text(
              '₹${(astrologer.additionalPerMinuteCharges ?? 0.0).round()}/Min',
              style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.maxFinite, 56.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ), //icons not available in assets
            label: const Text(
              "    Talk on Call    ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      trailing: Text('${(astrologer.experience ?? 0).round()} Years'),
    );
  }
}
